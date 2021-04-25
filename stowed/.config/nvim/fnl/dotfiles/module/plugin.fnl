(module dotfiles.module.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util dotfiles.util
             packer packer}})

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
            (use (a.assoc opts 1 name))))))))

;; Plugins to be managed by packer.
(use
  :HerringtonDarkholme/yats.vim {}
  :LnL7/vim-nix {}
  :Olical/AnsiEsc {}
  :Olical/aniseed {:branch :develop}
  :Olical/conjure {:branch :develop}
  :Olical/fennel.vim {}
  :Olical/nvim-local-fennel {}
  :Olical/vim-enmasse {}
  :PeterRincker/vim-argumentative {}
  :airblade/vim-gitgutter {}
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  :dag/vim-fish {}
  :easymotion/vim-easymotion {}
  :guns/vim-sexp {}
  :hashivim/vim-terraform {}
  :hrsh7th/nvim-compe {}
  :hylang/vim-hy {}
  :itchyny/lightline.vim {}
  :janet-lang/janet.vim {}
  :jiangmiao/auto-pairs {}
  :junegunn/fzf {}
  :junegunn/fzf.vim {}
  :lambdalisue/suda.vim {}
  :liuchengxu/vim-better-default {}
  :maxmellon/vim-jsx-pretty {}
  :mbbill/undotree {}
  :norcalli/nvim-colorizer.lua {}
  :pangloss/vim-javascript {}
  :prettier/vim-prettier {:ft :javascript}
  :radenling/vim-dispatch-neovim {}
  :srcery-colors/srcery-vim {}
  :tami5/compe-conjure {}
  :tpope/vim-abolish {}
  :tpope/vim-commentary {}
  :tpope/vim-dadbod {}
  :tpope/vim-dispatch {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  :w0rp/ale {}
  :wbthomason/packer.nvim {}
  :wlangstroth/vim-racket {}
  )

;; Plugin configuration that should be loaded even if the directory doesn't
;; exist or it isn't installed according to packer.
(def- always-load
  {:aniseed true
   :conjure true})

(def- packer-dir (.. (nvim.fn.stdpath :data) "/site/pack/packer"))

(defn- plugin-installed? [name]
  "Checks if the plugin directory can be found in the data directory."
  (or (= 1 (nvim.fn.isdirectory (.. packer-dir "/start/" name)))
      (= 1 (nvim.fn.isdirectory (.. packer-dir "/opt/" name)))))

(defn- find-plugin [candidate]
  "Returns the matching plugin name if the given plugin can be found within any
  of the required plugins So `deoplete` would match `deoplete.nvim`."
  (let [plugins (a.get _G :packer_plugins)]
    (or (and (a.get plugins candidate) candidate)
        (->> (a.keys plugins)
             (a.some
               (fn [plug-name]
                 (and (plug-name:find candidate 1 true) plug-name)))))))

;; Load plugin configuration modules.
(a.run!
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
