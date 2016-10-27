;;; olical-evil --- Tweaks and additions for evil mode.

;;; Commentary:

;; I want to add some bindings I miss, like [e from distinguished and
;; a few sexp manipulation bindings.

;;; Code:

(require 'evil)

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

(define-key evil-normal-state-map (kbd "[ SPC") 'olical-evil-new-line-above)
(define-key evil-normal-state-map (kbd "] SPC") 'olical-evil-new-line-below)
(define-key evil-normal-state-map (kbd "[ e") 'olical-evil-move-line-up)
(define-key evil-normal-state-map (kbd "] e") 'olical-evil-move-line-down)

(provide 'olical-evil)
;;; olical-evil.el ends here
