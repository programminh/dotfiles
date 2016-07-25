(defun delete-trailing-whitespace-unless-markdown ()
  "Delete trailing whitespaces only if not in markdown-mode."
  (unless (string= major-mode "markdown-mode") (delete-trailing-whitespace)))

(add-hook 'before-save-hook 'delete-trailing-whitespace-unless-markdown)

(provide 'whitespace)
