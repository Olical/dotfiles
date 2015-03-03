(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

(setq dotfiles-packages '())

(defmacro bundle (name &rest content)
  `(progn
    (add-to-list 'dotfiles-packages ',name)
    (el-get-bundle ,name ,@content)))

(defun dotfiles-sync ()
  (el-get-cleanup dotfiles-packages)
  (el-get-update-all t))

(bundle monokai-theme
        (load-theme 'monokai t))
