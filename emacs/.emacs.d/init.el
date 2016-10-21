;; https://github.com/lunaryorn/.emacs.d
;; http://aaronbedra.com/emacs.d/

;; Bootstrap package management.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Ensure use-package is present.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; I don't need use-package at runtime.
(eval-when-compile
  (require 'use-package))

;; Load packages
(use-package olical-core
  :load-path "pkgs/")

(use-package olical-perf
  :load-path "pkgs/")

(use-package olical-ui
  :load-path "pkgs/")

(use-package olical-user
  :load-path "pkgs/")
