; RELATIVE LINE NUMBERS EVERYWHERE!!!
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

; Except in:
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

; GIVE THE PARENTHESIS MORE FLAIR!!!
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

; Indentation
(use-package highlight-indent-guides
  :custom 
  (highlight-indent-guides-auto-enabled nil)
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-responsive 'stack)
  :hook
  (prog-mode . highlight-indent-guides-mode))

(defun current-line-hl ()
	;; Reset default -> Highlight entire line
	(setq hl-line-range-function nil)
	(hl-line-mode t))

(add-hook 'prog-mode-hook (lambda ()
			    (current-line-hl)))
