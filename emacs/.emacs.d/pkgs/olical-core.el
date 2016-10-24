;; User information.
(setq user-full-name "Oliver Caldwell")
(setq user-mail-address "olliec87@gmail.com")

;; Disable the splash.
(setq inhibit-splash-screen t
      initial-scratch-message nil)

;; Remove scroll bar, tool bar and menu bar.
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Don't store backups.
(setq make-backup-files nil)

;; Write generated configuration to an ignored file.
(setq custom-file "~/.emacs.d/custom.el")

(provide 'olical-core)
