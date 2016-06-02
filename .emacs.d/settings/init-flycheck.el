(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(add-to-list 'load-path "~/Hatchery/gocode/src/github.com/dougm/goflymake")
(require 'go-flycheck)

(provide 'init-flycheck)
