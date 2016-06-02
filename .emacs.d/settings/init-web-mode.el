(use-package web-mode
  :ensure t
  :init
  (setq web-mode-engines-alist
	'(("php"    . "\\.phtml\\'")
	  ("blade"  . "\\.blade\\.")))	  
  :mode
  ("\\.phtml\\'" "\\.phtml\\'" "\\.tpl\\.php\\'" "\\.blade\\.php\\'" "\\.[agj]sp\\'" "\\.as[cp]x\\'" "\\.erb\\'" "\\.mustache\\'" "\\.djhtml\\'" "\\.html?\\'"))

(provide 'init-web-mode)
