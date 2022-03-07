;;; .emacs --- Personal configuration file -*- lexical-binding: t -*-

;;   ___  __  __    _    ___  ___
;;  | __||  \/  |  /_\  / __|/ __|
;;  | _| | |\/| | / _ \| (__ \__ \
;;  |___||_|  |_|/_/ \_\\___||___/
;

;; Author: Dylan Kinnett <dylan@nocategories.net>
;; URL: https://nocategories.net
;; Version: 0.0.1
;; Package-Requires: ((emacs))

;;; Commentary:
;; This file sets up the essentials for incorporating my init org
;; file.  I'll use a style known as "literate programming", which I think is
;; particularly helpful for sharing Emacs configurations with a wider
;; audience that includes new or potential users (I am still very new
;; myself).
;;
;; default Windows location is c:/Users/Dylan/AppData/Roaming/.emacs
;; I have it symlinked from ~/.emacs

;; Documentation
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(package-selected-packages
   '(ergoemacs-mode helm vscode-dark-plus-theme vs-dark-theme markdown-mode dashboard use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; PACKAGE MANAGEMENT ________________________________________________________

;; Define and initialise package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)



;;; PACKAGES ===================================================================

;; Emacs Dashboard -------------------------------------------------------------
;; Emacs Dashboard is an extensible startup screen showing you recent files, bookmarks, agenda items and an Emacs banner.
;; https://github.com/emacs-dashboard/emacs-dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
(setq dashboard-startup-banner [logo])
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)

;; To customize which widgets are displayed, you can use the following snippet

(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                      ;;  (projects . 5)
                        (agenda . 5)
                        (registers . 5)))


;; Helm ------------------------------------------------------------------------
;; Helm is an incremental completion and selection narrowing framework
;; http://tuhdo.github.io/helm-intro.html
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)


;; ergoemacs--------------------------------------------------------------------
;; Use the commonly bound keys familiar to most people today.
;; https://ergoemacs.github.io/

(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)


;; Undo-fu
;; light wrapper for Emacs built-in undo system, adding convenient undo/redo
;; https://github.com/emacsmirror/undo-fu
(use-package undo-fu
  :config
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

;;; KEYBINDS ===================================================================

;; "command palatte" minibuffer provided by Helm
(global-set-key (kbd "C-S-p")   'helm-M-x)

;;; MAJOR MODES ================================================================

; Markdown Mode
; Used with .md , .txt, and .markdown files
; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode)
         ("\\.txt\\'" . gfm-mode))
  :init (setq markdown-command "multimarkdown"))
(setq default-major-mode 'gfm-mode) ;; markdown mode by default
(setq initial-major-mode 'gfm-mode) ;; use markdown mode for scratch file
(setq initial-scratch-message "\
# This buffer is for notes you don't want to save, and for Ruby code.
# If you want to create a file, visit that file with C-x C-f,
# then enter the text in that file's own buffer.")

;; ORG MODE
;; https://lucidmanager.org/productivity/emacs-for-distraction-free-writing/



;;; THEME _____________________________________________________________________

;; VS Dark Theme
(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))



;;; FONTS _____________________________________________________________________


;;; HTML/CSS __________________________________________________________________

;; CSS
(require 'css-mode)
(setq css-indent-offset 2)
