;; Hide all the default GUI crap.
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Maximise by default.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Don't use the awful OSX full screen.
(setq ns-use-native-fullscreen nil)
