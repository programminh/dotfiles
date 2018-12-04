(use-package exec-path-from-shell
  :ensure t
  :if window-system
  :init
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "SSH_AGENT_PID")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))

(provide 'init-exec-path-from-shell)
