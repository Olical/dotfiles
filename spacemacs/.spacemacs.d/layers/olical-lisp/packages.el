(defconst olical-lisp-packages
  '(lispy))

(defun olical-lisp/init-lispy ()
  (use-package lispy)
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1))))
