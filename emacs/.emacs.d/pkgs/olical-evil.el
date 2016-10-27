;;; olical-evil --- Tweaks and additions for evil mode.

;;; Commentary:

;; I want to add some bindings I miss, like [e from distinguished and
;; a few sexp manipulation bindings.

;;; Code:

(require 'evil)

(defun olical-evil-new-line-above (count)
  "Create new lines above your current one.  COUNT is the number of new lines."
  (interactive "p")
  (evil-open-above count)
  (evil-force-normal-state)
  (evil-next-line 1))

(defun olical-evil-new-line-below (count)
  "Create new lines below your current one.  COUNT is the number of new lines."
  (interactive "p")
  (evil-open-below count)
  (evil-force-normal-state)
  (evil-previous-line 1))

(define-key evil-normal-state-map (kbd "[ SPC") 'olical-evil-new-line-above)
(define-key evil-normal-state-map (kbd "] SPC") 'olical-evil-new-line-below)

(provide 'olical-evil)
;;; olical-evil.el ends here
