;; El-Get manages my packages.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; This is the list of required packages that should be kept when performing
;; el-get-cleanup. The names provided to the bundle macro are added
;; automatically.
(setq dotfiles-packages '())

;; These are helper macros and functions for the management of my packages.
(defmacro bundle (name &rest content)
  "Passthrough for el-get-bundle that records the package name in dotfiles-packages."
  `(progn
     (add-to-list 'dotfiles-packages ',name)
     (el-get-bundle ,name ,@content)))

(defun dotfiles-sync ()
  "Removes all packages not specified with the bundle macro and updates what's left."
  (el-get-cleanup dotfiles-packages)
  (el-get-update-all t))

;; Package definitions from here on in.
(bundle monokai-theme
        (load-theme 'monokai t))

(bundle flycheck
        (add-hook 'after-init-hook #'global-flycheck-mode))

(bundle magit
        (global-set-key (kbd "C-x g") 'magit-status))

(bundle projectile
        (projectile-global-mode))

(bundle helm
        (global-set-key (kbd "M-x") 'helm-M-x))

(bundle js2-mode
        (add-hook 'js-mode-hook 'js2-mode))

(bundle exec-path-from-shell
        (when (memq window-system '(mac ns))
          (exec-path-from-shell-initialize)))

(bundle perspective
        (persp-mode)
        (require 'persp-projectile))

(bundle dired-plus)

(bundle smartparens
        (smartparens-global-mode t)
        (require 'smartparens-config))

(bundle evil
        :type github
        :pkgname "emacsmirror/evil"
        (evil-mode t))

(bundle evil-matchit
        (global-evil-matchit-mode t))

(bundle evil-nerd-commenter
        (evilnc-default-hotkeys))

(bundle evil-numbers
        (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
        (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

(bundle evil-surround
        (global-evil-surround-mode t))

(bundle evil-visualstar
        (global-evil-visualstar-mode))

(bundle evil-jumper
        (global-evil-jumper-mode))

(bundle evil-escape
        (setq-default evil-escape-key-sequence "jk")
        (evil-escape-mode))

(bundle evil-easymotion
        (evilem-default-keybindings "SPC"))

(bundle company-mode
        (add-hook 'after-init-hook 'global-company-mode))

(bundle company-tern)

(bundle tern
        (add-hook 'js2-mode-hook 'tern-mode))
