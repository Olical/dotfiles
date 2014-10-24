(defvar Wolfy87-packages
  '(
    evil-args
    evil-numbers
    evil-search-highlight-persist
    magit-gitflow
    smooth-scrolling
    ))

(defun Wolfy87/init-evil-args ()
  (use-package evil-args
    :init
    (progn
      ;; Bind evil-args text objects.
      (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
      (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

      ;; Bind evil-forward/backward-args.
      (define-key evil-normal-state-map "L" 'evil-forward-arg)
      (define-key evil-normal-state-map "H" 'evil-backward-arg)
      (define-key evil-motion-state-map "L" 'evil-forward-arg)
      (define-key evil-motion-state-map "H" 'evil-backward-arg)

      ;; Bind evil-jump-out-args.
      (define-key evil-normal-state-map "K" 'evil-jump-out-args))))

(defun Wolfy87/init-evil-numbers ()
  (use-package evil-numbers
    :init
    (progn
      (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
      (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))))

(defun Wolfy87/init-evil-search-highlight-persist ()
  (use-package evil-search-highlight-persist
    :init
    (progn
      (global-evil-search-highlight-persist t)
      (evil-leader/set-key "cs" 'evil-search-highlight-persist-remove-all))))

(defun Wolfy87/init-magit-gitflow ()
  (use-package magit-gitflow
    :init
    (progn
      (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))))

(defun Wolfy87/init-smooth-scrolling ()
  (use-package smooth-scrolling
    :init
    (progn
      (setq scroll-margin 5
            scroll-conservatively 9999
            scroll-step 1))))
