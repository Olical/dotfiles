(when (< emacs-major-version 24)
  (error "This setup requires Emacs v24, or higher. You have: v%d" emacs-major-version))

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(defvar my-packages '(evil)
  "A list of packages to check for and install at launch.")

(defun my-missing-packages ()
  (let (missing-packages)
    (dolist (package my-packages (reverse missing-packages))
      (or (package-installed-p package)
      (push package missing-packages)))))

(defun ensure-my-packages ()
  (let ((missing (my-missing-packages)))
    (when missing
      ; Check for new packages (package versions)
      (package-refresh-contents)
      ; Install the missing packages
      (mapc (lambda (package)
          (when (not (package-installed-p package))
        (package-install package)))
        missing)
      ; Close the compilation log.
      (let ((compile-window (get-buffer-window "*Compile-Log*")))
    (if compile-window
        (delete-window compile-window))))))

(ensure-my-packages)

(evil-mode t)
