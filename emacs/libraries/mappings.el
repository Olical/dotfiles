(require 'dired-x)

(define-key evil-normal-state-map (kbd "-") 'dired-jump)
(define-key dired-mode-map (kbd "-") 'dired-up-directory)

(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(evil-leader/set-key
  "h" 'helm-mini)
