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
   '(vscode-dark-plus-theme vs-dark-theme markdown-mode dashboard use-package)))
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



;; PACKAGES

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
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))



;;; KEYBINDS

;; + list-packages After, find the package ergoemacs-mode and install it with
;; Then add the following to your ~/.emacs or ~/.emacs.d/init.el file:

;; (package-initialize)
;; (require 'ergoemacs-mode)


;;; MAJOR MODES ________________________________________________________

; Markdown Mode
; Used with .md , .txt, and .markdown files
; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.txt\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

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
