(use-package helm
  :ensure t
  :config
  (helm-mode t)
  (add-to-list 'helm-completing-read-handlers-alist
               '(find-file . ido)))


(provide 'init-helm)
