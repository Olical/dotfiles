(module dotfiles.plugin.telescope
  {autoload {nvim aniseed.nvim
             util dotfiles.util
             telescope telescope}})

(telescope.setup
  {:defaults
   {:vimgrep_arguments ["rg" "--color=never" "--no-heading"
                        "--with-filename" "--line-number" "--column"
                        "--smart-case" "--hidden" "--follow"
                        "-g" "!.git/"]}})

(util.lnnoremap :ff "Telescope find_files hidden=true")
(util.lnnoremap :f- "Telescope file_browser")
(util.lnnoremap :fg "Telescope live_grep")
(util.lnnoremap :* "Telescope grep_string")
(util.lnnoremap :fb "Telescope buffers")
(util.lnnoremap :fH "Telescope help_tags")
(util.lnnoremap :fm "Telescope keymaps")
(util.lnnoremap :fM "Telescope marks")
(util.lnnoremap :fh "Telescope oldfiles")
(util.lnnoremap :ft "Telescope filetypes")
(util.lnnoremap :fc "Telescope commands")
(util.lnnoremap :fC "Telescope command_history")
(util.lnnoremap :fq "Telescope quickfix")
(util.lnnoremap :fl "Telescope loclist")
(util.lnnoremap :fsa "Telescope lsp_code_actions")
(util.lnnoremap :fsi "Telescope lsp_implementations")
(util.lnnoremap :fsr "Telescope lsp_references")
(util.lnnoremap :fsS "Telescope lsp_document_symbols")
(util.lnnoremap :fss "Telescope lsp_workspace_symbols")
