# Neovim configuration in Fennel

My new 2025 Neovim configuration in Fennel, compiled by [nfnl][].

I'm skimming [awesome-neovim][] to find all the things I need.

## To Do

 - [x] Plugin manager (lazy)
 - [x] Fennel compiler + bootstrap mostly in Fennel (nfnl)
 - [x] Directory browser and editor (oil)
 - [x] Colour scheme (onedark)
 - [x] Notification system (nvim-notify)
 - [x] Status line / clean and helpful UI elements (lualine)
 - [x] Key hints + pneumonic and handy mappings (jk, leader+q)
 - [x] Fuzzy search
 - [x] Brace and quote matching (nvim-autopairs)
 - [x] Sexpression editing (paredit, need to check keys)
 - [x] Buffer navigation (flash, needs some tweaking and reading)
 - [x] Tree Sitter
 - [x] REPL (Conjure!)
 - [x] Make autopairs more aggressive, it misses some closing ones if there's already one on the line
 - [x] Show whitespace (whitespace.nvim)
 - [x] Trailing whitespace trimming (whitespace.nvim)
 - [x] Disable folding by default (fold level 0 or something?)
 - [x] Persistent undo
 - [x] Undo tree UI
 - [x] Completion (cmp)
 - [x] AI
 - [x] Spelling
 - [ ] LSP (and integrate cmp)
 - [ ] Linting / warning tool if LSP isn't always good enough
 - [ ] Git (probably just lazygit)
 - [ ] Sessions
 - [ ] Highlight matching word on hover?
 - [ ] Fennel indentation is never right, can it be improved?

 ## Quirks

 - [ ] Why does statusline flash on every oil buffer?

[nfnl]: https://github.com/Olical/nfnl
[awesome-neovim]: https://github.com/rockerBOO/awesome-neovim
