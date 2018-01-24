(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-missing-semi-warning nil)

(defun join (sep strs)
  "Join by SEP on STRS."
  (mapconcat 'identity strs sep))

(setenv "PATH" (join ":" (list (getenv "PATH") "~/bin")))
(setq exec-path (append exec-path (list "~/bin")))
