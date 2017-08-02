(require 'sql)
(add-hook 'sql-mode-hook
          (lambda ()
            (sql-highlight-postgres-keywords)
            (smartparens-mode nil)
            (smartparens-strict-mode nil)
            (evil-smartparens-mode nil)))

(sql-set-product-feature 'postgres :prompt-regexp "^[[:alnum:]_]*[=][#>] ")
(sql-set-product-feature 'postgres :prompt-cont-regexp "^[[:alnum:]_]*[-('\"][#>] ")

(setq sql-connection-alist '(("social-dev"
                              (sql-product 'postgres)
                              (sql-server "localhost")
                              (sql-port 5432)
                              (sql-database "social")
                              (sql-user "social"))

                             ("social-dev-feeds"
                              (sql-product 'postgres)
                              (sql-server "localhost")
                              (sql-port 5432)
                              (sql-database "social_feeds")
                              (sql-user "social_feeds"))

                             ("social-live"
                              (sql-product 'postgres)
                              (sql-server "localhost")
                              (sql-port 5436)
                              (sql-database "social")
                              (sql-user "social"))

                             ("social-live-rr"
                              (sql-product 'postgres)
                              (sql-server "localhost")
                              (sql-port 5435)
                              (sql-database "social")
                              (sql-user "social"))

                             ("social-beta1"
                              (sql-product 'postgres)
                              (sql-server "localhost")
                              (sql-port 5437)
                              (sql-database "social")
                              (sql-user "social"))

                             ("social-beta2"
                              (sql-product 'postgres)
                              (sql-server "localhost")
                              (sql-port 5437)
                              (sql-database "social_beta2")
                              (sql-user "social"))

                             ("social-beta3"
                              (sql-product 'postgres)
                              (sql-server "localhost")
                              (sql-port 5437)
                              (sql-database "social_beta3")
                              (sql-user "social")))
      sql-send-terminator t)

(add-hook 'sql-interactive-mode-hook 'sql-rename-buffer)
(setq sql-product 'postgres)
