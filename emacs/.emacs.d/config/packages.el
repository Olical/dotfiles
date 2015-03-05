;; El-Get manages my packages.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

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

(bundle ace-jump-mode)

(bundle js2-mode
        (add-hook 'js-mode-hook 'js2-mode))

(bundle auto-complete)

(bundle tern
        (require 'tern-auto-complete)
        (tern-ac-setup)
        (add-hook 'js2-mode-hook 'tern-mode))

(bundle exec-path-from-shell
        (when (memq window-system '(mac ns))
          (exec-path-from-shell-initialize)))

(bundle perspective
        (persp-mode)
        (require 'persp-projectile))

(bundle dired+)

(bundle dtrt-indent)

(bundle smartparens
        (smartparens-global-mode t)
        (require 'smartparens-config))

(bundle evil
        (evil-mode t)

        ;; change mode-line color by evil state
        (lexical-let ((default-color (cons (face-background 'mode-line)
                                           (face-foreground 'mode-line))))
          (add-hook 'post-command-hook
                    (lambda ()
                      (let ((color (cond ((minibufferp) default-color)
                                         ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                                         ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                                         ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                                         (t default-color))))
                        (set-face-background 'mode-line (car color))
                        (set-face-foreground 'mode-line (cdr color)))))))

(bundle evil-leader
        (global-evil-leader-mode))

(bundle evil-matchit
        (global-evil-matchit-mode t))

(bundle evil-nerd-commenter
        (evilnc-default-hotkeys))

(bundle evil-numbers
        (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
        (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

(bundle evil-surround
        (global-evil-surround-mode t))

(bundle bling/evil-visualstar
        :depends evil
        :features evil-visualstar
        (global-evil-visualstar-mode))

(bundle bling/evil-jumper
        :depends evil
        :features evil-jumper
        (global-evil-jumper-mode))
