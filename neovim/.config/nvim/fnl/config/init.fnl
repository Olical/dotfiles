(local core (require :aniseed.core))
(local nvim (require :aniseed.nvim))
(local util (require :config.util))

;; Load all config modules in no particular order.
(->> (util.glob (.. util.config-path "/lua/config/module/*.lua"))
     (core.run! (fn [path]
                  (require (string.gsub path ".*/(.-)/(.-)/(.-)%.lua" "%1.%2.%3")))))

{:aniseed/module :config.init}
