;;; olical-evil --- Tweaks and additions for evil mode.

;;; Commentary:

;; I want to add some bindings I miss, like [e from distinguished and
;; a few sexp manipulation bindings.

;;; Code:

(require 'evil)
(require 'dired)

(defun olical-evil-new-line-above (count)
  "Create COUNT lines above this one."
  (interactive "p")
  (evil-open-above count)
  (evil-force-normal-state)
  (evil-next-line 1))

(defun olical-evil-new-line-below (count)
  "Create COUNT lines below this one."
  (interactive "p")
  (evil-open-below count)
  (evil-force-normal-state)
  (evil-previous-line 1))

(defun olical-evil-move-line-up (count)
  "Move line up COUNT lines."
  (interactive "p")
  (dotimes (n count)
    (transpose-lines 1)
    (evil-previous-line 2)))

(defun olical-evil-move-line-down (count)
  "Move line down COUNT lines."
  (interactive "p")
  (dotimes (n count)
    (evil-next-line 1)
    (transpose-lines 1)
    (evil-previous-line 1)))

;; Some essentials from vim-unimpaired.
(define-key evil-normal-state-map (kbd "[ SPC") 'olical-evil-new-line-above)
(define-key evil-normal-state-map (kbd "] SPC") 'olical-evil-new-line-below)
(define-key evil-normal-state-map (kbd "[ e") 'olical-evil-move-line-up)
(define-key evil-normal-state-map (kbd "] e") 'olical-evil-move-line-down)

;; vim-vinegar emulation.
(define-key evil-normal-state-map (kbd "-") 'dired-jump)
(define-key dired-mode-map (kbd "-") 'dired-up-directory)

;; Use Emacs mode for the listed modes.
(defun olical-set-mode-to-default-emacs (mode)
  "Set the default state for the given MODE to Emacs."
  (evil-set-initial-state mode 'emacs))

(mapc 'olical-set-mode-to-default-emacs
      '(cider-classpath-mode
        cider-doc-mode
        cider-docview-mode
        cider-inspector-mode
        cider-popup-buffer-mode
        cider-stacktrace-mode
        cider-test-report-mode
        cider--debug-mode
        cljr--change-signature-mode
        magit-branch-manager-mode
        magit-commit-mode
        magit-log-mode
        magit-popup-mode
        magit-popup-sequence-mode
        git-rebase-mode))

;; Attempt to set a decent default shift width.
(setq evil-shift-width 2)

(provide 'olical-evil)
;;; olical-evil.el ends here
