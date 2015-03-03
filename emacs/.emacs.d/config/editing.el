;; Spaces, please.
(setq-default indent-tabs-mode nil)

;; No more new lines.
(setq require-final-newline nil)
(setq next-line-add-newlines nil)

;; Backup to one place.
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
