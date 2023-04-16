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

(defun mode-line-empty ()
  (propertize "  "
              'font-lock-face '(:background "#131414" :box (:color "#131414"))))

;; Set the modeline to tell me the filename, hostname, etc..
(setq mode-line-format
      (let* ((left '((:eval (cond (( eq evil-state 'visual)
				   (propertize " <V> "
					       'font-lock-face '(:background "#66FC7E"
								 :foreground "black"
								 :family "Cartograph CF Extra Bold"
								 :box (:color "#66FC7E"))))
				  (( eq evil-state 'normal)
				   (propertize " <N> "
					       'font-lock-face '(:background "#FF9447"
								 :foreground "black"
								 :family "Cartograph CF Extra Bold"
								 :box (:color "#FF9447"))))
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
			     " %b"))
		     (right '("%l:%c"))
		     (len-right (length (format-mode-line right))))

		(list left
		      ;; Fill until the end of line but 10 characters
		      (mode-line-fill 'mode-line len-right)
		      right)))
