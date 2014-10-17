;;; dotfiles --- My personal Emacs configuration.

;;; Commentary:

;; This configuration was born from my Vim usage.  Opinions may vary.

;;; Code:
(require 'package)
(require 'whitespace)

;; Raise the GC threshold massively.
;; My machine can handle it.
(setq gc-cons-threshold 20000000)

;; Remove clutter.
(add-hook 'after-init-hook '(lambda ()
                              (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
                              (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
                              (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))))

;; No splash screen.
(setq inhibit-splash-screen t)

;; No excess files.
(setq make-backup-files nil)

;; Start maximised.
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; Show matching parenthesis.
(show-paren-mode t)

;; Use spaces, not tabs, and default to four.
(setq-default tab-width 4 indent-tabs-mode nil)

;; Display all whitespace.
(setq whitespace-style '(face
                         tabs
                         tab-mark
                         trailing))
(global-whitespace-mode)

;; Spell checking.
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Font.
(add-to-list 'default-frame-alist '(font . "terminus"))
(set-face-attribute 'default t :font "terminus")
(set-face-attribute 'default nil :height 120)

;; HTML indentation correction.
(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))

;; Main package list to fetch from melpa.
(defvar dotfiles-packages
  '(evil
    evil-args
    evil-nerd-commenter
    evil-surround
    evil-paredit
    evil-numbers
    evil-visualstar
    evil-jumper
    evil-leader
    solarized-theme
    powerline
    ace-jump-mode
    autopair
    helm
    projectile
    helm-projectile
    rainbow-delimiters
    company
    company-tern
    js2-mode
    flycheck
    magit
    magit-gitflow
    git-gutter
    ag
    json-mode
    dired+
    dtrt-indent
    clojure-mode
    cider
    feature-mode
    exec-path-from-shell))

;; Package manager configuration.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defun dotfiles-sync ()
  "Install packages."
  (interactive)
  (delete-obsolete-packages)
  (package-refresh-contents)
  (dolist (p dotfiles-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Package pruning tools.
(defun flatten (mylist)
  "Flatten MYLIST, taken from http://rosettacode.org/wiki/Flatten_a_list#Emacs_Lisp for sanity."
  (cond
   ((null mylist) nil)
   ((atom mylist) (list mylist))
   (t
    (append (flatten (car mylist)) (flatten (cdr mylist))))))

(defun filter (predicate subject)
  "Use PREDICATE to filter SUBJECT and return the result."
  (delq nil
        (mapcar (lambda (x) (and (funcall predicate x) x)) subject)))

(defun get-package-name (package)
  "Fetch the symbol name of a PACKAGE."
  (car package))

(defun get-package-version (package)
  "Return the version string for PACKAGE."
  (package-version-join (aref (cdr package) 0)))

(defun get-package-dependencies (package)
  "Fetch the symbol list of PACKAGE dependencies."
  (mapcar 'car (elt (cdr package) 1)))

(defun get-packages-dependency-tree (packages)
  "Recursively fetch all dependencies for PACKAGES and return a tree of lists."
  (mapcar (lambda (package)
            (list (get-package-name package)
                  (get-packages-dependency-tree (get-package-dependencies package))))
          (get-packages-as-alist packages)))

(defun get-packages-as-alist (packages)
  "Return the list of PACKAGES symbols as an alist, containing version and dependency information."
  (filter (lambda (n) (car (member (car n) packages))) package-alist))

(defun get-all-current-dependencies ()
  "Return all dependencies for the current package list."
  (delq nil (delete-dups (flatten (get-packages-dependency-tree dotfiles-packages)))))

(defun get-all-obsolete-packages ()
  "Return all packages in an alist which are not contained in the current dependency tree."
  (filter (lambda (n) (not (member (car n) (get-all-current-dependencies)))) package-alist))

(defun delete-obsolete-packages ()
  "Delete all packages that are no longer referenced in my dependencies list or their dependencies."
  (mapc (lambda (n)
          (package-delete
           (symbol-name (get-package-name n))
           (get-package-version n)))
        (get-all-obsolete-packages)))

;; A macro from milkbox.net to make load hooks easier.
(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))

;; Individual package configuration.
(defvar evil-want-C-u-scroll t)
(after `evil-autoloads
  (evil-mode t))

(after `evil-args-autoloads
  ;; Bind evil-args text objects.
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

  ;; Bind evil-forward/backward-args.
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-motion-state-map "L" 'evil-forward-arg)
  (define-key evil-motion-state-map "H" 'evil-backward-arg)

  ;; Bind evil-jump-out-args.
  (define-key evil-normal-state-map "K" 'evil-jump-out-args))

(after `evil-nerd-commenter-autoloads
  (evilnc-default-hotkeys))

(after `evil-surround-autoloads
  (global-evil-surround-mode t))

(after `evil-paredit-autoloads
  (add-hook 'clojure-mode-hook 'evil-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))

(after `evil-numbers-autoloads
  (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

(after `evil-leader-autoloads
  (global-evil-leader-mode))

(after `solarized-theme-autoloads
  (defvar solarized-distinct-fringe-background t)
  (defvar solarized-high-contrast-mode-line t)
  (load-theme 'solarized-dark t))

(after `powerline-autoloads
  (powerline-center-evil-theme))

(after `ace-jump-mode-autoloads
  (define-key evil-normal-state-map (kbd "SPC") 'evil-ace-jump-word-mode)
  (define-key evil-normal-state-map (kbd "M-SPC") 'evil-ace-jump-line-mode)
  (define-key evil-normal-state-map (kbd "S-M-SPC") 'evil-ace-jump-char-mode))

(after `autopair-autoloads
  (autopair-global-mode))

(after `helm-autoloads
  (require 'helm-config)
  (global-set-key (kbd "C-c h") 'helm-mini)
  (helm-mode t))

(after `projectile-autoloads
  (projectile-global-mode))

(after `rainbow-delimiters-autoloads
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(after `company-autoloads
  (global-company-mode)
  (global-set-key (kbd "M-n") 'company-complete-common))

(after `flycheck-autoloads
  (global-flycheck-mode))

(after `js2-mode-autoloads
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(after `company-tern-autoloads
  (add-hook 'js2-mode-hook (lambda () (tern-mode t))))

(after `magit-autoloads
  (global-set-key (kbd "C-c g") 'magit-status))

(after `magit-gitflow-autoloads
  (require 'magit-gitflow)
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(after `git-gutter-autoloads
  (global-git-gutter-mode t))

(after `exec-path-from-shell-autoloads
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(provide 'init)
;;; init.el ends here
