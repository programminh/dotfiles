(use-package ido
  :ensure t
  :config
  (ido-mode t))

(use-package ido-ubiquitous
  :ensure t
  :init
  (setq ido-everywhere t)
  :config
  (ido-ubiquitous))

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




