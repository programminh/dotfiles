(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (setq flycheck-gometalinter-fast t)
    (setq flycheck-gometalinter-tests t)
    (setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))
    (flycheck-gometalinter-setup)))

(provide 'init-flycheck)
