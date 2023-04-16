(use-package evil
  :init
  (setq evil-want-keybinding nil))

(use-package evil-collection
  :after evil
  :init
  (evil-collection-init))


; Toggle evil-mode
(global-set-key (kbd "C-e")
  (lambda ()
    (interactive)
    (evil-mode)))

(define-key evil-normal-state-map (kbd "C-e") 'evil-mode)

(evil-mode)
