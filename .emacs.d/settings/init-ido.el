(use-package ido
  :ensure t)

(use-package ido-vertical-mode
  :ensure t
  :init
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down) ;; Up and down arrows
  :config
  (ido-vertical-mode))

(use-package flx-ido
  :ensure t
  :init
  (setq ido-enable-flex-matching t)
  :config
  (flx-ido-mode t))

(provide 'init-ido)
