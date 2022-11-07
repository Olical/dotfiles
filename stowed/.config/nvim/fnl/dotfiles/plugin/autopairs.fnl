(module dotfiles.plugin.autopairs
  {require {a aniseed.core}})

(def lisps [:scheme :lisp :clojure :fennel])

(defn disable-rule-for-filetypes []
  (let [autopairs (require :nvim-autopairs)]
    (a.assoc-in
      (autopairs.get_rule "'")
      [1 :not_filetypes]
      lisps)))

(let [(ok? autopairs) (pcall require :nvim-autopairs)]
  (when ok?
    (autopairs.setup)
    (disable-rule-for-filetypes "'" lisps)
    (disable-rule-for-filetypes "`" lisps)))
