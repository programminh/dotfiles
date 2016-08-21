(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'helm)
  :config
  (projectile-global-mode))


(provide 'init-projectile)
