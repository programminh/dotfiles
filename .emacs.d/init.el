;; Massively based on https://github.com/magnars/.emacs.d/blob/master/init.el

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Disable splash screen
(setq inhibit-startup-message t)

;; Disable annoying bell sound
(setq bell-volume 0)
(setq visible-bell 1)

;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)

;; Keybindings
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Initialize package manager
(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))


(package-initialize)

;; Install use-package if not installed
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Disable warning
(put 'dired-find-alternate-file 'disabled nil)

(require 'appearance)
(require 'whitespace)
(require 'uniquify)
(require 'init-helm)
(require 'init-ido)
(require 'init-smex)
(require 'init-multiple-cursors)
(require 'init-magit)
(require 'init-web-mode)
(require 'init-projectile)
(require 'init-helm-projectile)
(require 'init-company)
(require 'init-go-mode)
(require 'init-exec-path-from-shell)
(require 'init-flycheck)
(require 'init-major-text-mode)
(require 'init-php)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ac-php dockerfile-mode json-mode markdown-mode flycheck-gometalinter flycheck exec-path-from-shell company-go company helm-projectile projectile web-mode magit multiple-cursors smex flx-ido ido-vertical-mode ido-completing-read+ helm gotham-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
