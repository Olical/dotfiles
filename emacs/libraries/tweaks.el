(add-hook 'after-init-hook '(lambda ()
  (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
))

(setq inhibit-splash-screen t)
(setq make-backup-files nil)

(require 'linum)
(global-linum-mode t)
