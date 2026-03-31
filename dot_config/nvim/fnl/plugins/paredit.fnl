(import-macros {: tx} :config.macros)
(local {: autoload} (require :nfnl.module))
(local paredit (autoload :nvim-paredit))

(tx "julienvincent/nvim-paredit"
  {:event "VeryLazy"
   :opts {}
   :keys [(tx "<localleader>w"
              (fn []
                (paredit.cursor.place_cursor
                  (paredit.wrap.wrap_element_under_cursor "( " ")")
                  {:placement "inner_start"
                   :mode "insert"}))
              {:desc "Wrap element insert head"})
          (tx "<localleader>W"
              (fn []
                (paredit.cursor.place_cursor
                  (paredit.wrap.wrap_element_under_cursor "(" " )")
                  {:placement "inner_end"
                   :mode "insert"}))
              {:desc "Wrap element insert tail"})
          (tx "<localleader>i"
              (fn []
                (paredit.cursor.place_cursor
                  (paredit.wrap.wrap_enclosing_form_under_cursor "( " ")")
                  {:placement "inner_start"
                   :mode "insert"}))
              {:desc "Wrap form insert head"})
          (tx "<localleader>I"
              (fn []
                (paredit.cursor.place_cursor
                  (paredit.wrap.wrap_enclosing_form_under_cursor "(" " )")
                  {:placement "inner_end"
                   :mode "insert"}))
              {:desc "Wrap form insert tail"})]})
