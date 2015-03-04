;; Spaces, please.
(setq-default indent-tabs-mode nil)

;; No more new lines.
(setq require-final-newline nil)
(setq next-line-add-newlines nil)

;; Backup to one place.
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Enable selling.
(autoload 'flyspell-mode "flyspell" t)
(setq ispell-program-name "/usr/local/bin/aspell")
