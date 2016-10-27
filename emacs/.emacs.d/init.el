;;; init --- My personal Emacs configuration.

;;; Commentary:

;; I base everything off of use-package.  I am migrating from Vim.  Expect Evilness.

;;; Code:

(load-file "./package-bootstrap.el")

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

(use-package helm-ag
  :ensure t)

(use-package magit
  :ensure t
  :config (global-set-key (kbd "C-x g") 'magit-status))

(use-package base16-theme
  :ensure t
  :init (setq custom-safe-themes t)
  :config (load-theme 'base16-chalk))

(use-package dired+
  :ensure t)

(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook #'enable-paredit-mode))

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

(use-package olical-evil
  :load-path "pkgs")

(use-package evil-paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'evil-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'evil-paredit-mode)
  (add-hook 'ielm-mode-hook #'evil-paredit-mode)
  (add-hook 'lisp-mode-hook #'evil-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'evil-paredit-mode)
  (add-hook 'scheme-mode-hook #'evil-paredit-mode)
  (add-hook 'clojure-mode-hook #'evil-paredit-mode))

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

(provide 'init)
;;; init.el ends here
