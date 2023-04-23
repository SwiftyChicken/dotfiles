; BASE PACKAGE
(use-package god-mode)

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-define-key 'normal global-map (kbd "SPC") 'evil-execute-in-god-state)
  (evil-define-key 'god global-map [escape] 'evil-god-state-bail)
  (evil-mode 1))



; COLLECTION PACKAGE
(use-package evil-god-state)
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

; New state => GOD MODE
(defun evil-god-start-hook ()
  (god-local-mode 1))

(defun evil-god-stop-hook ()
  (god-local-mode -1))

(evil-define-state god-mode
  "God state."
  :tag " <G> "
  :message "-- GOD MODE --"
  :entry-hook (evil-god-start-hook)
  :exit-hook (evil-god-stop-hook)
  :input-method t
  :intercept-esc nil)
