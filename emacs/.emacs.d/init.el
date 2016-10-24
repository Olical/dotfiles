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

;; I don't like this custom stuff.
;; Write it all to a file I ignore.
(setq custom-file "~/.emacs.d/custom.el")

;; Bootstrap package management.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Packages.
(use-package helm-config
  :ensure helm
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files))
  :config
  (helm-mode 1)
  (setq helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t))

(use-package evil
  :ensure t
  :diminish evil
  :init (setq evil-want-C-u-scroll t)
  :config (evil-mode 1))

(use-package magit
  :ensure t
  :config (global-set-key (kbd "C-x g") 'magit-status))
