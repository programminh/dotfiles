(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IDO & filecache: smart file name completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ido)

;; Improved flex matching
(require 'flx-ido)
 
;; (setq ido-everywhere nil
;;       ;; ido-enable-flex-matching t
;;       ido-create-new-buffer 'always
;;       ido-file-extensions-order '(".java" ".js" ".el" ".xml")
;;       ido-use-filename-at-point 'guess
;;       ido-use-faces t
;;       )
(ido-mode 'buffer)

;; Vertical completion menu
(require 'ido-vertical-mode)
(ido-vertical-mode)

;; IDO support pretty much everwhere, including eclim-java-implement
(require 'ido-ubiquitous)
(ido-ubiquitous)

;; General project support
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching nil
      projectile-globally-ignored-directories '("target"))
(global-set-key "\C-cf" 'projectile-find-file)

;; Enhanced M-x
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; Comment or uncomment current line
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "C-/") 'toggle-comment-on-line)

;; Web modes
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\.")))

(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-indent-style-offset 4)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Snippets
(require 'yasnippet)
(yas-global-mode)

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140519.650/dict")
(ac-config-default)
(add-to-list 'ac-modes 'web-mode)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(define-key ac-completing-map [return] nil)
(define-key ac-completing-map "\r" nil)

;; Projectile find file
(global-set-key (kbd "C-x p") 'projectile-find-file)

;; Set indentation to 4 spaces
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 4) ; set tab width to 4 for all buffers
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode t)
 '(tab-width 4))
(setq c-basic-offset 4)

(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Source Code Pro")
  (set-face-attribute 'default nil :height 120))

(load-theme 'zenburn t)
(provide 'emacs)

;;; better-defaults.el --- Fixing weird quirks and poor defaults

;; Copyright © 2013 Phil Hagelberg

;; Author: Phil Hagelberg
;; URL: https://github.com/technomancy/better-defaults
;; Version: 0.1.2
;; Created: 2013-04-16
;; Keywords: convenience

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; There are a number of unfortunate facts about the way Emacs works
;; out of the box. While all users will eventually need to learn their
;; way around in order to customize it to their particular tastes,
;; this package attempts to address the most obvious of deficiencies
;; in uncontroversial ways that nearly everyone can agree upon.

;; Obviously there are many further tweaks you could do to improve
;; Emacs, (like those the Starter Kit and similar packages) but this
;; package focuses only on those that have near-universal appeal.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(ido-mode t)
(setq ido-enable-flex-matching t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(when true true);
;;; better-defaults.el ends here

;;; .emacs ends here
