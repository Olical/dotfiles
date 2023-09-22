(local uu (require :user.util))
(local fun (require :user.vendor.fun))

(local lisps [:scheme :lisp :clojure :fennel])

[(uu.tx
  :windwp/nvim-autopairs
  {:init (fn []
           (local autopairs (require :nvim-autopairs))
           (tset (fun.head (autopairs.get_rules "'")) :not_filetypes lisps)
           (tset (fun.head (autopairs.get_rules "`")) :not_filetypes lisps)
           (autopairs.setup
             {:ignored_next_char ""
              :enable_check_bracket_line false}))})

 (uu.tx
   :julienvincent/nvim-paredit
   {:dependencies ["julienvincent/nvim-paredit-fennel"]
    :ft ["clojure" "scheme" "lisp" "timl" "fennel" "janet"]
    :config (fn []
              (let [paredit (require :nvim-paredit)
                    paredit-fennel (require "nvim-paredit-fennel")]
                (paredit.setup
                  {:keys
                   {:<A-H> [paredit.api.slurp_backwards "Slurp backwards"]
                    :<A-J> [paredit.api.barf_backwards "Barf backwards"]
                    :<A-K> [paredit.api.barf_forwards "Barf forwards"]
                    :<A-L> [paredit.api.slurp_forwards "Slurp forwards"]

                    :<localleader>w
                    [(fn []
                       (paredit.cursor.place_cursor
                         (paredit.wrap.wrap_element_under_cursor "( " ")")
                         {:placement :inner_start
                          :mode :insert}))
                     "Wrap element insert head"]

                    :<localleader>W
                    [(fn []
                       (paredit.cursor.place_cursor
                         (paredit.wrap.wrap_element_under_cursor "(" ")")
                         {:placement :inner_end
                          :mode :insert}))
                     "Wrap element insert tail"]

                    :<localleader>i
                    [(fn []
                       (paredit.cursor.place_cursor
                         (paredit.wrap.wrap_enclosing_form_under_cursor "( " ")")
                         {:placement :inner_start
                          :mode :insert}))
                     "Wrap form insert head"]

                    :<localleader>I
                    [(fn []
                       (paredit.cursor.place_cursor
                         (paredit.wrap.wrap_enclosing_form_under_cursor "(" ")")
                         {:placement :inner_end
                          :mode :insert}))
                     "Wrap form insert tail"]}})
                (paredit-fennel.setup)))})]
