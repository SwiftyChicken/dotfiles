(defun mode-line-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 10))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " " 'face face
              'display `(space :align-to (- right
					     (-1 . right-margin)
					     ,(- reserve 0)))))

;; Set the modeline to tell me the filename, hostname, etc..
(setq-default mode-line-format
      (let* ((left '((:eval (cond ((eq evil-state 'visual)
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
		     (:eval (propertize (format-mode-line " %b ")
					'face 'cogent-line-buffer-name-face
					'help-echo (buffer-file-name)))
		     (:eval (list (propertize (nyan-create) 'font-lock-face '(:background "#1E3666"
									      :box (:line-width (1 . -3) :color "#272447")))))))

		     (right '("%l:%c"))
		     (len-right (length (format-mode-line right))))

		(list left
		      (mode-line-fill 'mode-line len-right)
		      right)))
