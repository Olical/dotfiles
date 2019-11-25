(local nvim (require :aniseed.nvim))
(local core (require :aniseed.core))
(local util (require :config.util))

;; Set up vim-plug, like in init.vim earlier.
(nvim.fn.plug#begin (.. (nvim.fn.stdpath "data") "/plugged"))

;; Make it slightly easier to define each plugin.
(fn plug [coord opts]
  (nvim.fn.plug# coord opts))

;; This is in init.vim but if it's not here too sync.sh will delete it.
(plug "Olical/aniseed")

;; Define all required plugins.
(plug "Olical/conjure" {:branch :develop :do "bin/compile"})
(plug "Olical/vim-enmasse")
(plug "PeterRincker/vim-argumentative")
(plug "Shougo/deoplete.nvim") (plug "ncm2/float-preview.nvim")
(plug "airblade/vim-gitgutter")
(plug "bakpakin/fennel.vim")
(plug "dag/vim-fish")
(plug "easymotion/vim-easymotion")
(plug "embear/vim-localvimrc")
(plug "guns/vim-sexp") (plug "tpope/vim-sexp-mappings-for-regular-people")
(plug "hashivim/vim-terraform")
(plug "itchyny/lightline.vim")
(plug "jiangmiao/auto-pairs" {:tag "v2.0.0"})
(plug "lambdalisue/suda.vim")
(plug "leafgarland/typescript-vim")
(plug "liuchengxu/vim-better-default")
(plug "liuchengxu/vim-clap" {:commit "6248e65d7044ca17df16bb7ffeb099a2f2d7da97"})
(plug "norcalli/nvim-colorizer.lua")
(plug "pangloss/vim-javascript") (plug "maxmellon/vim-jsx-pretty")
(plug "prettier/vim-prettier" {:do "yarn install" :for ["javascript"]})
(plug "radenling/vim-dispatch-neovim")
(plug "simnalamburt/vim-mundo")
(plug "srcery-colors/srcery-vim")
(plug "tpope/vim-abolish")
(plug "tpope/vim-commentary")
(plug "tpope/vim-dadbod")
(plug "tpope/vim-dispatch")
(plug "tpope/vim-eunuch")
(plug "tpope/vim-fugitive")
(plug "tpope/vim-repeat")
(plug "tpope/vim-sleuth")
(plug "tpope/vim-surround")
(plug "tpope/vim-unimpaired")
(plug "tpope/vim-vinegar")
(plug "w0rp/ale")

(nvim.fn.plug#end)

;; Load plugin configuration modules.
(core.run!
  (fn [path]
    (let [name (nvim.fn.fnamemodify path ":t:r")]
      (if (. nvim.g.plugs name)
        (require (.. "config.module.plugin." name))
        (core.pr "Warning: Config file found for plugin '"
                 name
                 "' but it's not installed."))))
  (util.glob (.. (nvim.fn.stdpath "config") "/lua/config/module/plugin/*.lua")))
