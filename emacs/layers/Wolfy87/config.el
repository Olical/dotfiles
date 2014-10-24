;; Raise the GC threshold massively.
;; My machine can handle it.
(setq gc-cons-threshold 20000000)

;; Start maximised.
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; Spell checking.
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(erc-spelling-mode 1)

;; Display all whitespace.
(require 'whitespace)
(setq whitespace-style '(face
                         tabs
                         tab-mark
                         trailing))
(global-whitespace-mode)

;; Mode mappings.
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
