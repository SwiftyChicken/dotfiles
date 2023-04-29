; BASIC CLEAN UP EMACS
(tool-bar-mode   -1)
(menu-bar-mode   -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(setq-default cursor-in-non-selected-windows nil)
(setq-default truncate-lines t)
(setq backup-directory-alist '(("." . "~/.cache/emacs_backup")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LOAD RELEVANT PATHS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'custom-theme-load-path (concat (file-truename user-emacs-directory)
                                             "local/themes"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;; CUSTOME KEYBINDINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make ESC quit prompts
(global-set-key (kbd "C-o") 'keyboard-escape-quit)
(global-set-key (kbd "C-x C-k") 'kill-current-buffer)

; Window management (-> breaks C-w : which is vim equivalent of `db`)
(global-set-key (kbd "C-w") nil)
(global-set-key (kbd "C-w C-v") 'split-window-right)
(global-set-key (kbd "C-w C-h") 'split-window-bellow)
(global-set-key (kbd "C-w C-o") 'delete-other-windows)
(global-set-key (kbd "C-w C-c") 'delete-window)

; Reload config
(global-set-key (kbd "C-S-R")
  (lambda ()
    (interactive)
    (load-file user-init-file)
    (evil-normal-state)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;; SETUP PACKAGE MANAGER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;; CUSTOME FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Configuration of plugins
(defun load-lib (library)
  (load (concat (expand-file-name library (concat (file-truename user-emacs-directory)
                                                "local/lib/"))
                ".el")))

; Configuration of personal emacs functions
(defun load-bin (bin)
  (load (concat (expand-file-name bin (concat (file-truename user-emacs-directory)
                                                "local/bin/"))
                ".el")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONFIG SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; BASICS
(load-theme 'salmon-dragon t)

; LOAD FILE MODES SPECIFIC CONFIGURATIONS
(mapc 'load (directory-files-recursively (concat (file-truename user-emacs-directory)
						 "local/etc/") ""))

;; LOAD PLUGINS CONFIGURATIONS
; Dashboard mode
(load-lib "icons")

; Dashboard mode
(load-lib "dashboard")

; Search and completions mode
(load-lib "ivy")
(load-lib "help")

; Evil + GOD mode
(load-lib "evil-god")

(load-lib "tabs")

; Modeline
(load-bin "simple-modeline")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ATUO CONFIG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(geiser-racket lsp-mode evil-textobj-anyblock on-parens rainbow-delimiters smartparens geiser quack racket-mode nyan-mode markdown-mode yuck-mode haskell-mode undo-tree command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
