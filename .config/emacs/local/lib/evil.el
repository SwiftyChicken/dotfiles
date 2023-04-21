; BASE PACKAGE
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-set-initial-state 'dashboard-mode 'emacs))

(evil-mode)

; COLLECTION PACKAGE
(use-package evil-collection
  :after evil
  :init
  (evil-collection-init))

; EXTRA PACKAGES
; * & # can now search visual selection
(use-package evil-visualstar)
(global-evil-visualstar-mode)

; Add extra surrounding element with tag functionalities
; See: https://github.com/emacs-evil/evil-surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

; Undo-Redo Capabilities
(use-package undo-fu)
(use-package undo-fu-session) ; Making undo-fu persistent
(global-undo-fu-session-mode)

; TEMPORARY
; Toggle evil-mode
(global-set-key (kbd "C-e")
  (lambda ()
    (interactive)
    (evil-mode)))

(define-key evil-normal-state-map (kbd "C-e") 'evil-mode)
