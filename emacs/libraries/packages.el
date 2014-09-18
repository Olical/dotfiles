(require 'package)
(require 'cl)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar packages '(zenburn-theme
		   evil
		   evil-tabs
		   linum-relative
		   smart-mode-line
		   ace-jump-mode))

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


(require 'evil)
(evil-mode t)


(require 'evil-tabs)
(global-evil-tabs-mode t)


(require 'linum-relative)
(global-linum-mode t)


(require 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'respectful)


(require 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)
