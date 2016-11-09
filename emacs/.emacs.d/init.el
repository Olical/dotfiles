;;; init --- My personal Emacs configuration.

;;; Commentary:

;; I base everything off of use-package.  I am migrating from Vim.  Expect Evilness.

;;; Code:

(load-file "~/.emacs.d/package-bootstrap.el")
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Packages.
(use-package olical-core
  :load-path "pkgs")

(use-package olical-evil
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

(use-package helm-ag
  :ensure t)

(use-package magit
  :ensure t
  :diminish auto-revert-mode
  :config (global-set-key (kbd "C-x g") 'magit-status))

(use-package powerline
  :ensure t
  :config (powerline-center-evil-theme))

(use-package base16-theme
  :ensure t
  :init (setq custom-safe-themes t)
  :config (load-theme 'base16-chalk))

(use-package dired+
  :ensure t)

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode 1)
  (evil-leader/set-key
    "g" 'magit-status
    "x" 'helm-M-x
    "b" 'helm-buffers-list
    "f" 'helm-find-files
    "p" 'projectile-commander
    "s" 'eshell))

(use-package evil
  :ensure t
  :diminish evil-mode undo-tree-mode
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up))

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

(use-package evil-lispy
  :ensure t
  :diminish evil-lispy-mode lispy-mode
  :config
  (add-hook 'emacs-lisp-mode-hook #'evil-lispy-mode)
  (add-hook 'clojure-mode-hook #'evil-lispy-mode))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-mode 1)
  (setq projectile-enable-caching t))

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
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0.03)
  (setq company-minimum-prefix-length 1)
  (setq company-require-match nil)
  (setq company-show-numbers t))

(use-package company-tern
  :ensure t
  :config
  (add-hook 'js-mode-hook 'tern-mode)
  (add-to-list 'company-backends 'company-tern))

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

(use-package dtrt-indent
  :ensure t
  :config (dtrt-indent-mode 1))

(use-package flyspell
  :diminish flyspell-mode flyspell-prog-mode
  :config
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode))

(use-package fish-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package cider
  :ensure t
  :diminish cider-auto-test-mode
  :config (cider-auto-test-mode 1))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config (which-key-mode))

(provide 'init)
;;; init.el ends here
