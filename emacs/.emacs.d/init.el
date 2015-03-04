(defun load-config (file)
  "Prefixes the file name with the config file directory path and loads the
  file."
  (load-file (expand-file-name file "~/.emacs.d/config")))

(load-config "ui.el")
(load-config "editing.el")
(load-config "packages.el")
