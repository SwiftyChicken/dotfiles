; BASE PACKAGE
(use-package god-mode)

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  (setq evil-search-module 'isearch) 
  :custom
  (evil-echo-state nil)
  (evil-ex-search-persistent-highlight nil)
  :config
  ; Set Of Extra defined keybindings ;p
  (evil-define-key 'normal global-map (kbd "C-h") 'evil-window-left)
  (evil-define-key 'normal global-map (kbd "C-j") 'evil-window-down)
  (evil-define-key 'normal global-map (kbd "C-k") 'evil-window-up)
  (evil-define-key 'normal global-map (kbd "C-l") 'evil-window-right)
  (evil-define-key 'normal global-map (kbd "SPC") 'evil-execute-in-god-state)
  (evil-define-key 'god global-map [escape] 'evil-god-state-bail)
  ; Let the fun begin... >:)
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

; isearch history like evil-search/vim
(define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)
(define-key isearch-mode-map (kbd "C-j") 'isearch-ring-advance)
(define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat)
(define-key isearch-mode-map (kbd "C-k") 'isearch-ring-retreat)
