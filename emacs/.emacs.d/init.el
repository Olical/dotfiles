;;; init --- My personal Emacs configuration.

;;; Commentary:

;; I base everything off of use-package.  I am migrating from Vim.  Expect Evilness.

;;; Code:

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
(use-package olical-core
  :load-path "pkgs")

(use-package helm-config
  :ensure helm
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-mini)
	 ("C-x C-f" . helm-find-files))
  :init (setq-default helm-M-x-fuzzy-match t
		      helm-buffers-fuzzy-matching t
		      helm-recentf-fuzzy-match t)
  :config
  (helm-mode 1))

(use-package magit
  :ensure t
  :config (global-set-key (kbd "C-x g") 'magit-status))

(use-package base16-theme
  :ensure t
  :init (setq custom-safe-themes t)
  :config (load-theme 'base16-chalk))

(use-package dired+
  :ensure t)

(use-package evil
  :ensure t
  :diminish evil-mode undo-tree-mode
  :init (setq-default evil-want-C-u-scroll t)
  :config (evil-mode 1))

(use-package evil-escape
  :ensure t
  :diminish evil-escape-mode
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode 1))

(use-package evil-easymotion
  :ensure t
  :config (evilem-default-keybindings "SPC"))

(use-package evil-surround
  :ensure t
  :config (global-evil-surround-mode 1))

(use-package evil-commentary
  :ensure t
  :diminish evil-commentary-mode
  :config (evil-commentary-mode 1))

(use-package evil-numbers
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package projectile
  :ensure t
  :config (projectile-mode 1))

(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))

(use-package smartparens-config
  :ensure smartparens
  :diminish smartparens-mode
  :config (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package indent-guide
  :ensure t
  :diminish indent-guide-mode
  :config (indent-guide-global-mode 1))

(use-package company
  :ensure t
  :diminish company-mode
  :config (add-hook 'after-init-hook 'global-company-mode))

(use-package company-quickhelp
  :ensure t
  :diminish company-quickhelp-mode
  :config (company-quickhelp-mode 1))

(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :config (global-git-gutter-mode 1))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'init)
;;; init.el ends here
