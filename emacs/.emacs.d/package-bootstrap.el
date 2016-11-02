;;; package-bootstrap --- Initialise my package management.

;;; Commentary:

;; This file sets up package managment.  I put it in another file so I
;; can load it within my update script to update the package database.

;;; Code:

;; Bootstrap package management.
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(provide 'package-bootstrap)
;;; package-bootstrap.el ends here
