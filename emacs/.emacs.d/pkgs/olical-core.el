;;; olical-core --- Core configuraion for my Emacs.

;;; Commentary:

;; Sets up basic things.  Bigger changes will be moved to other packages.

;;; Code:

;; User information.
(setq user-full-name "Oliver Caldwell")
(setq user-mail-address "olliec87@gmail.com")

;; Disable the splash.
(setq inhibit-splash-screen t
      initial-scratch-message nil)

;; Select a nice font.
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))

;; Remove scroll bar, tool bar and menu bar.
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Don't store backups.
(setq make-backup-files nil)

;; Write generated configuration to an ignored file.
(setq custom-file "~/.emacs.d/custom.el")

;; Improve indentation.
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50))

;; Add some places to the path.
(defun olical-slurp (filePath)
  "Return FILEPATH's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(defun olical-nvm-path ()
  "Find the path to the current nvm bin if present."
  (let ((f "~/.nvm/alias/default"))
    (if (file-exists-p f)
        (concat "~/.nvm/versions/node/" (substring (olical-slurp f) 0 -1) "/bin"))))

(defun olical-join (sep strs)
  "Join by SEP on STRS."
  (mapconcat 'identity strs sep))

(setenv "PATH" (olical-join ":" (list (getenv "PATH") "~/bin" (olical-nvm-path))))
(setq exec-path (append exec-path (list "~/bin" (olical-nvm-path))))

;; Raise the GC threshold by a LOT.
(setq gc-cons-threshold 20000000)

(provide 'olical-core)
;;; olical-core ends here
