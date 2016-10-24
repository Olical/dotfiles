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
  :config
  (helm-mode 1)
  (setq helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t))

(use-package evil
  :ensure t
  :diminish evil-mode undo-tree-mode
  :init (setq evil-want-C-u-scroll t)
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

(use-package magit
  :ensure t
  :config (global-set-key (kbd "C-x g") 'magit-status))

(use-package base16-theme
  :ensure t
  :init (setq custom-safe-themes t)
  :config (load-theme 'base16-chalk))

(use-package evil-commentary
  :ensure t
  :diminish evil-commentary-mode
  :config (evil-commentary-mode 1))

(use-package evil-numbers
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

(use-package dired+
  :ensure t)
