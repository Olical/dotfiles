(defun load-config (file)
  (load-file (expand-file-name file "~/.emacs.d/config")))

(load-config "packages.el")
