(defun mode-line-fill (reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (propertize " " 'display `(space :align-to (- right
						(-1 . right-margin)
						,(+ reserve 2)))))

;; Set the modeline to tell me the filename, hostname, etc..
(setq-default mode-line-format
	      '(:eval (let* ((left '((:eval (cond ((eq evil-state 'visual)
						   (propertize " <V> "
							       'font-lock-face '(:background "#66FC7E"
											     :foreground "black"
											     :family "Cartograph CF Extra Bold"
											     :box (:color "#66FC7E"))))
						  (( eq evil-state 'normal)
						   (propertize " <N> "
							       'font-lock-face '(:background "#FEC900"
											     :foreground "black"
											     :family "Cartograph CF Extra Bold"
											     :box (:color "#FEC900"))))
						  (( eq evil-state 'insert)
						   (propertize " <I> "
							       'font-lock-face '(:background "#3399EE"
											     :foreground "black"
											     :family "Cartograph CF Extra Bold"
											     :box (:color "#3399EE"))))
						  (( eq evil-state 'replace)
						   (propertize " <R> "
							       'font-lock-face '(:background "#FF628E"
											     :foreground "black"
											     :family "Cartograph CF Extra Bold"
											     :box (:color "#FF628E"))))
						  (t
						   (propertize " EM "
							       'font-lock-face '(:background "#A37DF7"
											     :foreground "white"
											     :family "Cartograph CF Extra Bold"
											     :box (:color "#A37DF7"))))))
				     (:eval (propertize (format-mode-line "  %b ")
							'face '(:foreground "#A0ACF0" :inherit cogent-line-buffer-name-face)
							'help-echo (buffer-file-name)))))

			     (right '((:eval (propertize (format-mode-line "%l:%c")
							'face '(:family "Cartograph CF Thin" :inherit cogent-line-buffer-name-face)
							'help-echo (buffer-file-name)))))
			     (len-right (length (format-mode-line right))))

			(concat (format-mode-line left)
				(mode-line-fill len-right)
				(format-mode-line right)))))
