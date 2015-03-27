;;; .emacs --- My custom .emacs
;;; Commentary:
;;; Configuration based heavily upon Howard Abrams emacs.org
;;; @link https://github.com/howardabrams/dot-files/blob/master/emacs.org


;;; Code:

;; Disable GNU Emacs startup
(setq inhibit-startup-message t)

;; Create the following directories if it doesn't exists
(let* ((subdirs '("elisp" "backups" "snippets" "ac-dict"))
       (fulldirs (mapcar (lambda (d) (concat user-emacs-directory d)) subdirs)))
  (dolist (dir fulldirs)
    (when (not (file-exists-p dir))
      (message "Make directory: %s" dir)
      (make-directory dir))))

;; Add to load path packages that are not available on the package manager
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

;; Initialize package manager
(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed.
PACKAGES list of packages"
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing.  Install it? " package))
           (package-install package)
         package)))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed 'auto-complete
                          'magit
                          'flx
                          'flx-ido
                          'flycheck
                          'flycheck-color-mode-line
                          'ido-vertical-mode
                          'ido-ubiquitous
                          'helm
                          'projectile
                          'helm-projectile
                          'multiple-cursors
                          'web-mode
                          'js2-mode
                          'smex
                          'yasnippet
                          'php-mode
                          'zenburn-theme
                          'json-mode)

;; activate installed packages
(package-initialize)

;; Set indentation to 4 spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default tab-always-indent 'complete)

;; Display settings
(unless (window-system)
  (menu-bar-mode 0))              ;; No menus... but only in text mode

(when (window-system)
  (tool-bar-mode 0)               ;; Toolbars were only cool with XEmacs
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
  (scroll-bar-mode -1))            ;; Scrollbars are waste screen estate

(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Source Code Pro")
  (set-face-attribute 'default nil :height 120)
  (load-theme 'zenburn t))



;; Ido
(require 'ido)
(require 'flx-ido)
(require 'ido-vertical-mode)
(require 'ido-ubiquitous)

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(flx-ido-mode 1)
(ido-vertical-mode)
(ido-ubiquitous)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down) ;; Up and down arrows

;; Enhanced M-x
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

;; Multiple cursor
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Set backup to a single point
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Autocomplete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories (concat user-emacs-directory "ac-dict"))

  (set-default 'ac-sources
               '(ac-source-abbrev
                 ac-source-dictionary
                 ac-source-yasnippet
                 ac-source-words-in-buffer
                 ac-source-words-in-same-mode-buffers
                 ac-source-semantic))

  (ac-config-default)
  (global-auto-complete-mode t))

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(add-to-list 'yas-snippet-dirs (concat user-emacs-directory "snippets"))

;; JS2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(custom-set-variables
 '(js2-indent-switch-body t))


;; Whitespaces
(defun delete-trailing-whitespace-unless-markdown ()
  "Delete trailing whitespaces only if not in markdown-mode."
  (unless (string= major-mode "markdown-mode") (delete-trailing-whitespace)))

(add-hook 'before-save-hook 'delete-trailing-whitespace-unless-markdown)

;; Uniquify
(require 'uniquify)

;; Flycheck
(when (require 'flycheck nil t)
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (add-hook 'js2-mode-hook 'flycheck-mode))

(setq flycheck-jshintrc "~/.jshintrc")

;; Web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\.")))


;; Helm
(require 'helm-config)
(helm-mode 1)


;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching nil
      projectile-globally-ignored-directories '("target"))
(setq projectile-completion-system 'helm)

;; Helm Projectile
(require 'helm-projectile)
(helm-projectile-on)

;; Keybindings
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)


(provide 'emacs)
;;; .emacs ends here
(put 'downcase-region 'disabled nil)
