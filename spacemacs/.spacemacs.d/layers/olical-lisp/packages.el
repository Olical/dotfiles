(defconst olical-lisp-packages
  '(lispy
    evil-lispy))

(defun olical-lisp/init-lispy ()
  (use-package lispy))

(defun olical-lisp/init-evil-lispy ()
  (use-package evil-lispy)
  (add-hook 'emacs-lisp-mode-hook #'evil-lispy-mode)
  (add-hook 'clojure-mode-hook #'evil-lispy-mode))
