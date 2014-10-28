;; Raise the GC threshold massively.
(setq gc-cons-threshold 20000000)

;; Enable spell checking in code and IRC.
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(erc-spelling-mode 1)

;; Enable flycheck everywhere.
(global-flycheck-mode)

;; Display all whitespace.
(require 'whitespace)
(setq whitespace-style '(face
                         tabs
                         tab-mark
                         trailing))
(global-whitespace-mode)
