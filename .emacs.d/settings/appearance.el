;; Set-up my theme
(use-package dracula-theme
  :ensure t  
  :config
  (load-theme 'dracula t))

(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Source Code Pro")
  (set-face-attribute 'default nil :height 125))

(provide 'appearance)
