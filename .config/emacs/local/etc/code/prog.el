; RELATIVE LINE NUMBERS EVERYWHERE!!!
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

; Except in:
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(add-hook 'buffer-list-update-hook (lambda () (when (string-equal "*" (substring (buffer-name) 0 1))
						(display-line-numbers-mode 0))))

; GIVE THE PARENTHESIS MORE FLAIR!!!
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

; Indentation

; List of nice character indentations 
; │╽╿╏║╎┇︱┊︳┋┆╵〡〢╹╻❙╷〣⌇︴░▒▓⁞⋮∶⁚
; │╽╿╏║╎┇︱┊︳┋┆╵〡〢╹╻❙╷〣⌇︴░▒▓⁞⋮∶⁚
(use-package highlight-indent-guides
  :custom
  (highlight-indent-guides-auto-enabled nil)
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-character ?❙) 
  (highlight-indent-guides-responsive 'stack)
  :hook
  (prog-mode . highlight-indent-guides-mode))

(defun current-line-hl ()
  ;; Reset default -> Highlight entire line
  (setq hl-line-range-function nil)
  (hl-line-mode t))

(add-hook 'prog-mode-hook (lambda ()
			    (current-line-hl)))
