(module dotfiles.module.plugin
  {require {nvim aniseed.nvim
            core aniseed.core
            util dotfiles.util
            packer packer}})

(packer.startup
  (fn [use]
    (use {1 :HerringtonDarkholme/yats.vim})
    (use {1 :LnL7/vim-nix})
    (use {1 :Olical/AnsiEsc})
    (use {1 :Olical/aniseed})
    (use {1 :Olical/conjure})
    (use {1 :Olical/fennel.vim})
    (use {1 :Olical/nvim-local-fennel})
    (use {1 :Olical/vim-enmasse})
    (use {1 :PeterRincker/vim-argumentative})
    (use {1 :airblade/vim-gitgutter})
    (use {1 :clojure-vim/clojure.vim})
    (use {1 :clojure-vim/vim-jack-in})
    (use {1 :dag/vim-fish})
    (use {1 :easymotion/vim-easymotion})
    (use {1 :guns/vim-sexp})
    (use {1 :hashivim/vim-terraform})
    (use {1 :hrsh7th/nvim-compe})
    (use {1 :hylang/vim-hy})
    (use {1 :itchyny/lightline.vim})
    (use {1 :janet-lang/janet.vim})
    (use {1 :jiangmiao/auto-pairs :tag :v2.0.0})
    (use {1 :junegunn/fzf :commit :fc7630a66d8b07ec90603f7919f8aadf891783ac})
    (use {1 :junegunn/fzf.vim})
    (use {1 :lambdalisue/suda.vim})
    (use {1 :liuchengxu/vim-better-default})
    (use {1 :maxmellon/vim-jsx-pretty})
    (use {1 :norcalli/nvim-colorizer.lua})
    (use {1 :pangloss/vim-javascript})
    (use {1 :prettier/vim-prettier :ft :javascript})
    (use {1 :radenling/vim-dispatch-neovim})
    (use {1 :simnalamburt/vim-mundo})
    (use {1 :srcery-colors/srcery-vim})
    (use {1 :tami5/compe-conjure})
    (use {1 :tpope/vim-abolish})
    (use {1 :tpope/vim-commentary})
    (use {1 :tpope/vim-dadbod})
    (use {1 :tpope/vim-dispatch})
    (use {1 :tpope/vim-eunuch})
    (use {1 :tpope/vim-fugitive})
    (use {1 :tpope/vim-repeat})
    (use {1 :tpope/vim-sexp-mappings-for-regular-people})
    (use {1 :tpope/vim-sleuth})
    (use {1 :tpope/vim-surround})
    (use {1 :tpope/vim-unimpaired})
    (use {1 :tpope/vim-vinegar})
    (use {1 :w0rp/ale})
    (use {1 :wbthomason/packer.nvim})
    (use {1 :wlangstroth/vim-racket})
    ))

;; Plugin configuration that should be loaded even if the directory doesn't
;; exist or it isn't installed according to packer.
(def- always-load
  {:aniseed true
   :conjure true})

(def- data-dir (.. (nvim.fn.stdpath :data) "/plugged"))

(defn- plugin-installed? [name]
  "Checks if the plugin directory can be found in the data directory."
  (= 1 (nvim.fn.isdirectory (.. data-dir "/" name))))

(defn- find-plugin [candidate]
  "Returns the matching plugin name if the given plugin can be found within any
  of the required plugins So `deoplete` would match `deoplete.nvim`."
  (or (and (. packer_plugins candidate) candidate)
      (->> (core.keys packer_plugins)
           (core.some
             (fn [plug-name]
               (and (plug-name:find candidate 1 true) plug-name))))))

;; Load plugin configuration modules.
(core.run!
  (fn [path]
    (let [name (nvim.fn.fnamemodify path ":t:r")
          full-name (find-plugin name)
          bypass? (. always-load name)]
      (if (or bypass? full-name)
        (if (or bypass? (plugin-installed? full-name))
          (match (pcall require (.. "dotfiles.module.plugin." name))
            (false err) (print "Error requiring plugin module:" name "-" err))
          (print (.. "Not loading plugin module, not installed yet: " name)))
        (print (.. "Orphan plugin configuration: " name)))))
  (util.glob (.. (nvim.fn.stdpath "config") "/lua/dotfiles/module/plugin/*.lua")))
