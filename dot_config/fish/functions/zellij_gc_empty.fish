function zellij_gc_empty --description "Delete exited zellij sessions whose serialized layout has no recoverable panes"
    set -l root ~/.cache/zellij/contract_version_1/session_info
    test -d "$root"; or return 0

    for dir in $root/*/
        set -l layout "$dir/session-layout.kdl"
        test -f "$layout"; or continue

        # A layout is "empty" (unrecoverable) when no real `tab` block contains a
        # non-plugin pane. We walk brace depth, skip swap_*_layout/new_tab_template
        # blocks, and look inside real tabs for any `pane` line (bare, attributed,
        # or with a block body) — a dead command pane loses its `command=` attr on
        # re-serialization but still represents a pane worth preserving.
        set -l seen (awk '
            function trim(s){ sub(/^[[:space:]]+/,"",s); sub(/[[:space:]]+$/,"",s); return s }
            BEGIN { depth=0; skip_until=-1; in_tab_until=-1; seen=0 }
            {
                line = trim($0)
                if (skip_until < 0 && line ~ /^(swap_[a-z_]+_layout|new_tab_template)([[:space:]]|\{|$)/) skip_until = depth
                if (skip_until < 0 && line ~ /^tab([[:space:]]|\{|$)/) in_tab_until = depth
                if (skip_until < 0 && in_tab_until >= 0) {
                    if (line ~ /^pane([[:space:]]|\{|$)/) seen = 1
                }
                n = length($0)
                for (i = 1; i <= n; i++) {
                    c = substr($0, i, 1)
                    if (c == "{") depth++
                    else if (c == "}") {
                        depth--
                        if (skip_until >= 0 && depth == skip_until) skip_until = -1
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
