(require 'package)
(require 'cl)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar packages '(zenburn-theme
		   evil-leader
		   evil
		   evil-nerd-commenter
		   evil-jumper
		   evil-surround
		   evil-matchit
		   linum-relative
		   smart-mode-line
		   ace-jump-mode
		   helm))

(defun packages-installed-p ()
  (loop for p in packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

(load-theme 'zenburn t)

(require 'evil-leader)
(require 'evil)
(require 'evil-nerd-commenter)
(require 'evil-jumper)
(require 'evil-surround)
(require 'evil-matchit)
(require 'linum-relative)
(require 'smart-mode-line)
(require 'ace-jump-mode)
(require 'helm-config)

(global-evil-leader-mode)
(evil-mode t)
(evilnc-default-hotkeys)
(global-evil-surround-mode t)
(global-evil-matchit-mode t)

(global-linum-mode t)

(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'respectful)
