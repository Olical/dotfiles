(module dotfiles.module.plugin.clap
  {require {nvim aniseed.nvim
            util dotfiles.util}})

(set nvim.g.clap_provider_grep_delay 50)
(set nvim.g.clap_provider_grep_opts "-H --no-heading --vimgrep --smart-case --hidden -g !.git/")
(set nvim.g.clap_layout {:relative :editor})

(defn- clapmap [from to]
  (util.nnoremap
    from
    (.. ":Clap " to)))

(clapmap :* "grep ++query=<cword>")
(clapmap :fg "grep")
(clapmap :ff "files --hidden")
(clapmap :fd "filer")
(clapmap :fb "buffers")
(clapmap :fw "windows")
(clapmap :fh "history")
(clapmap :f: "command_history")
(clapmap :fj "jumps")
(clapmap :fl "blines")
(clapmap :fL "lines")
(clapmap :ft "filetypes")
(clapmap :fm "marks")
(clapmap :fy "yanks")
(clapmap :fr "registers")
