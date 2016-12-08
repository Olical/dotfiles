(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-missing-semi-warning nil)

;; Add some places to the path.
(defun slurp (filePath)
  "Return FILEPATH's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(defun nvm-path ()
  "Find the path to the current nvm bin if present."
  (let ((f "~/.nvm/alias/default"))
    (if (file-exists-p f)
        (concat "~/.nvm/versions/node/" (substring (slurp f) 0 -1) "/bin"))))

(defun join (sep strs)
  "Join by SEP on STRS."
  (mapconcat 'identity strs sep))

(setenv "PATH" (join ":" (list (getenv "PATH") "~/bin" (nvm-path))))
(setq exec-path (append exec-path (list "~/bin" (nvm-path))))
