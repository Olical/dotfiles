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

(bundle evil-visualstar
        :url "git@github.com:bling/evil-visualstar.git"
        :depends evil
        :features evil-visualstar
        (global-evil-visualstar-mode))

(bundle evil-jumper
        :url "git@github.com:bling/evil-jumper.git"
        :depends evil
        :features evil-jumper
        (global-evil-jumper-mode))

(bundle evil-args
        :url "git@github.com:wcsmith/evil-args.git"
        :depends evil
        :features evil-args

        ;; bind evil-args text objects
        (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
        (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

        ;; bind evil-forward/backward-args
        (define-key evil-normal-state-map "L" 'evil-forward-arg)
        (define-key evil-normal-state-map "H" 'evil-backward-arg)
        (define-key evil-motion-state-map "L" 'evil-forward-arg)
        (define-key evil-motion-state-map "H" 'evil-backward-arg)

        ;; bind evil-jump-out-args
        (define-key evil-normal-state-map "K" 'evil-jump-out-args))

(bundle evil-matchit
        :url "git@github.com:redguardtoo/evil-matchit.git"
        :depends evil
        :features evil-matchit
        (global-evil-matchit-mode t))

(bundle evil-nerd-commenter
        :url "git@github.com:redguardtoo/evil-nerd-commenter.git"
        :depends evil
        :features evil-nerd-commenter
        (evilnc-default-hotkeys))

(bundle evil-leader
        :url "git@github.com:cofi/evil-leader.git"
        :depends evil
        :featurs evil-leader
        (global-evil-leader-mode))

(bundle evil-numbers
        :url "git@github.com:cofi/evil-numbers.git"
        :depends evil
        :features evil-numbers
        (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
        (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

(bundle evil-surround
        :url "git@github.com:timcharper/evil-surround.git"
        :depends evil
        :features evil-surround
        (global-evil-surround-mode t))
