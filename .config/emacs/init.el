; BASIC CLEAN UP EMACS
(tool-bar-mode   -1)
(menu-bar-mode   -1)
(scroll-bar-mode -1)
(set-fringe-mode 40)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LOAD RELEVANT PATHS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'custom-theme-load-path (concat (file-truename user-emacs-directory)
                                             "local/themes"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;; CUSTOME KEYBINDINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; Reload config
(global-set-key (kbd "C-r")
  (lambda ()
    (interactive)
    (load-file user-init-file)))

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

(defun load-plugin (plugin)
  (load (concat (expand-file-name plugin (concat (file-truename user-emacs-directory)
                                                "local/plugin/"))
                ".el")))

(defun load-bin (bin)
  (load (concat (expand-file-name bin (concat (file-truename user-emacs-directory)
                                                "local/bin/"))
                ".el")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONFIG SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Basics
(load-theme 'salmon-dragon t)

; Evil mode
(load-plugin "evil")

; Modeline
(load-bin "simple-modeline")
