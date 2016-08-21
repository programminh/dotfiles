;; Set-up my theme
(use-package gotham-theme
  :ensure t)

(load-theme 'gotham t)

(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Consolas")
  (set-face-attribute 'default nil :height 145))

(provide 'appearance)
