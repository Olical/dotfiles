(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq dotfiles-required-packages '())
(defmacro bundle (name &rest content)
  `(progn
    (add-to-list 'dotfiles-required-packages ',name)
    (el-get-bundle ,name ,@content)))

(bundle monokai-theme
        (load-theme 'monokai t))

(el-get-cleanup dotfiles-required-packages)
