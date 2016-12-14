(defconst olical-indentation-packages
  '(dtrt-indent))

(defun olical-indentation/init-dtrt-indent ()
  (add-hook 'prog-mode-hook
            #'(lambda ()
                (dtrt-indent-mode)
                (dtrt-indent-adapt))))
