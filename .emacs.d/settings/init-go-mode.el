(use-package go-mode
  :ensure
  :init
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(provide 'init-go-mode)
