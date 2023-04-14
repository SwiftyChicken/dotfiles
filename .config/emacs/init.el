; CLEAN UP EMACS
(tool-bar-mode   -1)
(menu-bar-mode   -1)
(scroll-bar-mode -1)
(set-fringe-mode 40)
(setq-default mode-line-format nil)

(set-face-attribute 'default nil :font "Fira Code" :height 140)

; Reload config
(global-set-key (kbd "C-r")
  (lambda ()
    (interactive)
    (load-file user-init-file)))
