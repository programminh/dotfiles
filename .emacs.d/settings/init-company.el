(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-go
  :ensure t
  :init
  (add-hook 'go-mode-hook (lambda ()
			    (set (make-local-variable 'company-backends) '(company-go))
			    (company-mode))))

(provide 'init-company)
