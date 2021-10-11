(module dotfiles.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util dotfiles.util
             packer packer}})

(defn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :dotfiles.plugin. name))]
    (when (not ok?)
      (print (.. "dotfiles error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

;; Plugins to be managed by packer.
(use
  ; "~/repos/Olical/conjure" {:mod :conjure}
  ; "~/repos/Olical/aniseed" {}
  ; "~/repos/Olical/nvim-local-fennel" {}

  :HerringtonDarkholme/yats.vim {}
  :LnL7/vim-nix {}
  :Olical/AnsiEsc {}
  :Olical/aniseed {:branch :develop}
  :Olical/conjure {:branch :develop :mod :conjure}
  :Olical/nvim-local-fennel {}
  :Olical/vim-enmasse {}
  :PeterRincker/vim-argumentative {}
  :airblade/vim-gitgutter {}
  :beauwilliams/statusline.lua {:mod :statusline}
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  :dag/vim-fish {}
  :easymotion/vim-easymotion {:mod :easymotion}
  :folke/which-key.nvim {:mod :which-key}
  :guns/vim-sexp {:mod :sexp}
  :hashivim/vim-terraform {}
  :hrsh7th/nvim-compe {:mod :compe}
  :hylang/vim-hy {}
  :janet-lang/janet.vim {}
  :jiangmiao/auto-pairs {:mod :auto-pairs}
  :lambdalisue/suda.vim {}
  :lewis6991/impatient.nvim {}
  :liuchengxu/vim-better-default {:mod :better-default}
  :marko-cerovac/material.nvim {:mod :material}
  :maxmellon/vim-jsx-pretty {}
  :mbbill/undotree {:mod :undotree}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :norcalli/nvim-colorizer.lua {:mod :colorizer}
  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  :pangloss/vim-javascript {}
  :prettier/vim-prettier {:ft :javascript}
  :radenling/vim-dispatch-neovim {}
  :tami5/compe-conjure {}
  :tpope/vim-abolish {}
  :tpope/vim-commentary {}
  :tpope/vim-dadbod {}
  :tpope/vim-dispatch {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {:mod :fugitive}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  :tweekmonster/startuptime.vim {}
  :w0rp/ale {:mod :ale}
  :wbthomason/packer.nvim {}
  :wlangstroth/vim-racket {}

  ; :nvim-treesitter/nvim-treesitter {:run ":TSUpdate" :mod :treesitter}
  )
