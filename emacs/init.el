(require 'cl)
(require 'dired-x)

;; General tweaks.
(add-hook 'after-init-hook '(lambda ()
                              (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
                              (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
                              (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))))

;; No splash screen.
(setq inhibit-splash-screen t)

;; No excess files.
(setq make-backup-files nil)

;; Start maximised.
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; Always show line numbers.
(global-linum-mode t)

;; Show matching parenthesis.
(show-paren-mode t)

;; Use spaces, not tabs, and default to four.
(setq-default tab-width 4 indent-tabs-mode nil)

;; Package definition.
(setq el-get-sources
      '((:name evil
               :after (progn
                        (evil-mode t)))

        (:name color-theme-zenburn
               :after (progn
                        (load-theme 'zenburn t)))

        (:name evil-nerd-commenter
               :after (progn
                        (evilnc-default-hotkeys)))

        (:name evil-surround
               :after (progn
                        (global-evil-surround-mode t)))

        (:name smart-mode-line
               :after (progn
                        (setq sml/no-confirm-load-theme t)
                        (sml/setup)
                        (sml/apply-theme 'respectful)))

        (:name ace-jump-mode
               :after (progn
                        (define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)))

        (:name autopair
               :after (progn
                        (autopair-global-mode)))

        (:name helm
               :after (progn
                        (require 'helm-config)
                        (global-set-key (kbd "C-c h") 'helm-mini)
                        (helm-mode t))
               :depends async)

        (:name projectile
               :after (progn
                        (projectile-global-mode)))))

(setq my:el-get-packages '(linum-relative
                           evil-jumper
                           magit))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; Package manager (el-get) setup.
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq my:el-get-packages
      (append
       my:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))

(add-to-list 'el-get-recipe-path "~/dotfiles/emacs/el-get-recipes")

(el-get-cleanup my:el-get-packages)
(el-get 'sync my:el-get-packages)
