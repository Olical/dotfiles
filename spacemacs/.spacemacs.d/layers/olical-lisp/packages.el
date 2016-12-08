(defconst olical-lisp-packages
  '(lispy
    parinfer))

(defun olical-lisp/init-lispy ()
  (use-package lispy))

(defun olical-lisp/init-parinfer ()
  (use-package parinfer
    :init
    (progn
      (setq-default parinfer-lighters '(" infer" . " (infer)"))
      (setq-default parinfer-extensions
                    '(defaults
                       pretty-parens
                       evil
                       lispy
                       smart-tab
                       smart-yank))
      (add-hook 'clojure-mode-hook #'parinfer-mode)
      (add-hook 'racket-mode-hook #'parinfer-mode)
      (add-hook 'scheme-mode-hook #'parinfer-mode)
      (add-hook 'emacs-lisp-mode-hook #'parinfer-mode))))
