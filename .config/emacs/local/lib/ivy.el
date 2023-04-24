(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-n" . ivy-next-history-element)
         ("<down>" . ivy-next-history-element)
         ("TAB" . ivy-partial-or-done)
         ("C-k" . ivy-previous-line)
         ("C-p" . ivy-previous-history-element)
         ("<up>" . ivy-previous-history-element)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-p" . ivy-previous-history-element)
         ("<up>" . ivy-previous-history-element)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("RET" . ivy-done)
         ("C-k" . ivy-previous-line)
         ("C-p" . ivy-previous-history-element)
         ("<up>" . ivy-previous-history-element)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-x C-b" . 'counsel-switch-buffer)
	 ("C-x b" . 'counsel-switch-buffer-other-window)
	 ("C-x C-b" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

(use-package prescient)
(use-package ivy-prescient
  :after counsel
  :custom
  (ivy-prescient-enable-filtering t)
  :config
  ;; Uncomment the following line to have sorting remembered across sessions!
  (prescient-persist-mode 1)
  (ivy-prescient-mode 1))

(global-set-key (kbd "C-x C-t") 'switch-to-buffer-other-tab)
