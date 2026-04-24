function zellij_gc_empty --description "Delete exited zellij sessions whose serialized layout has no recoverable panes"
    set -l root ~/.cache/zellij/contract_version_1/session_info
    test -d "$root"; or return 0

    for dir in $root/*/
        set -l layout "$dir/session-layout.kdl"
        test -f "$layout"; or continue

        # A layout is "empty" (unrecoverable) when every tab contains only
        # plugin-wrapper panes (tab-bar / status-bar). When a command pane's
        # process exits and the session is re-serialized, the `command=` attr is
        # sometimes dropped, leaving the tab with only its chrome — attaching to
        # that instant-exits. We walk brace depth, skip swap_*_layout /
        # new_tab_template blocks, and inside each tab look for a pane that is
        # either bare, carries `command=`, wraps sub-panes, or contains a
        # non-`plugin` body line (e.g. `start_suspended true`).
        set -l seen (awk '
            function trim(s){ sub(/^[[:space:]]+/,"",s); sub(/[[:space:]]+$/,"",s); return s }
            BEGIN { depth=0; skip_until=-1; in_tab_until=-1; pane_depth=-1; pane_has_real=0; seen=0 }
            {
                line = trim($0)
                if (skip_until < 0 && line ~ /^(swap_[a-z_]+_layout|new_tab_template)([[:space:]]|\{|$)/) skip_until = depth
                if (skip_until < 0) {
                    if (line ~ /^tab([[:space:]]|\{|$)/ && in_tab_until < 0) in_tab_until = depth
                    if (in_tab_until >= 0 && line ~ /^pane([[:space:]]|\{|$)/) {
                        if (pane_depth < 0) {
                            if (line ~ /command=/) seen = 1
                            if (line ~ /\{/) { pane_depth = depth; pane_has_real = 0 }
                            else seen = 1
                        } else {
                            pane_has_real = 1
                        }
                    } else if (pane_depth >= 0 && line != "" && line !~ /^plugin([[:space:]]|\{|$)/ && line !~ /^[{}]/) {
                        pane_has_real = 1
                    }
                }
                n = length($0)
                for (i = 1; i <= n; i++) {
                    c = substr($0, i, 1)
                    if (c == "{") depth++
                    else if (c == "}") {
                        depth--
                        if (skip_until >= 0 && depth == skip_until) skip_until = -1
                        if (pane_depth >= 0 && depth == pane_depth) {
                            if (pane_has_real) seen = 1
                            pane_depth = -1
                        }
                        if (in_tab_until >= 0 && depth == in_tab_until) in_tab_until = -1
                    }
                }
            }
            END { print seen }
        ' "$layout")

        if test "$seen" = "0"
            set -l name (basename "$dir")
            zellij delete-session "$name" 2>/dev/null
        end
    end
end
