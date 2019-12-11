(local nvim (require :aniseed.nvim))
(local core (require :aniseed.core))
(local util (require :config.util))

(fn plug [coord opts]
  "Defines a plugin through vim-plug."
  (nvim.fn.plug# coord opts))

(fn find-plugin [candidate]
  "Returns the matching plugin name if the given plugin can be found within any
  of the required plugins So `deoplete` would match `deoplete.nvim`."
  (or (and (. nvim.g.plugs candidate) candidate)
      (->> (core.keys nvim.g.plugs)
           (core.some
             (fn [plug-name]
               (and (plug-name:find candidate 1 true) plug-name))))))

(local data-dir (.. (nvim.fn.stdpath "data") "/plugged"))

(fn plugin-installed? [name]
  "Checks if the plugin directory can be found in the data directory."
  (= 1 (nvim.fn.isdirectory (.. data-dir "/" name))))

;; Set up vim-plug, like in init.vim earlier.
(nvim.fn.plug#begin data-dir)

;; This is in init.vim but if it's not here too sync.sh will delete it.
(plug "Olical/aniseed" {:branch :develop})

;; Define all required plugins.
(plug "Olical/conjure" {:branch :develop :do :bin/compile})
(plug "Olical/nvim-local-fennel" {:branch :develop})
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
(plug "liuchengxu/vim-clap" {:tag "v0.2"})
(plug "norcalli/nvim-colorizer.lua")
(plug "pangloss/vim-javascript") (plug "maxmellon/vim-jsx-pretty")
(plug "prettier/vim-prettier" {:do "yarn install" :for [:javascript]})
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

;; Plugin configuration that should be loaded even if the directory doesn't
;; exist or it isn't installed according to vim-plug.
(local always-load
  {:aniseed true})

;; Load plugin configuration modules.
(core.run!
  (fn [path]
    (let [name (nvim.fn.fnamemodify path ":t:r")
          full-name (find-plugin name)
          bypass? (. always-load name)]
      (if (or bypass? full-name)
        (if (or bypass? (plugin-installed? full-name))
          (match (pcall require (.. "config.module.plugin." name))
            (false err) (print "Error requiring plugin module:" name "-" err))
          (print (.. "Not loading plugin module, not installed yet: " name)))
        (print (.. "Orphan plugin configuration: " name)))))
  (util.glob (.. (nvim.fn.stdpath "config") "/lua/config/module/plugin/*.lua")))
