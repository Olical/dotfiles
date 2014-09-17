(require 'package)
(require 'cl)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar packages '(evil
		   evil-tabs))

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


(require 'evil)
(evil-mode t)


(require 'evil-tabs)
(global-evil-tabs-mode t)
