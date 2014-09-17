(defvar libraries '("packages"
                    "tweaks"))

(defvar init-path (or load-file-name (buffer-file-name)))
(defvar current-directory
  (let ((segments (butlast (split-string init-path "/"))))
    (mapconcat 'identity segments "/")))

(defvar here )
(add-to-list 'load-path (format "%s/%s" current-directory "libraries"))
(mapc 'load-library libraries)
