(use-package dashboard
  :ensure t
  :custom
  ;; Set info & center
  (dashboard-set-init-info t)
  (dashboard-set-navigator t)
  (dashboard-show-shortcuts t)
  (dashboard-center-content t)
  (dashboard-startup-banner (concat (file-truename user-emacs-directory)
				    "local/share/salmon-dragon.png"))
  (dashboard-banner-logo-title "Welcome to Emacs")
  ;; Add icons
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons nil)
  :custom-face
  (dashboard-banner-logo-title ((nil (:family "Fira Code Medium"
				      :foundry "CTDB" 
				      :height 190 
				      :foreground "white"
				      :weight black))))
  (dashboard-version-info ((nil (:family "Fira Code Regular"
			      :foundry "CTDB" 
			      :height 190 
			      :foreground "#878787"
			      :weight demibold))))
  (dashboard-init-info ((nil (:family "Fira Code Light"
			      :foundry "CTDB" 
			      :height 160 
			      :foreground "#878787"
			      :weight medium))))
  (dashboard-heading   ((nil (:family "Cartograph CF Bold Italic"
			      :height 200 
			      :foreground "#FF9447"
			      :weight demibold))))
  (dashboard-heading-icon   ((nil (:family "Fira Code Medium"
			      :height 220 
			      :foreground "#FF9447"
			      :weight medium))))
  (dashboard-items-face ((nil (:family "Fira Code Light"
			      :foundry "CTDB" 
			      :height 150 
			      :foreground "#DCE1FF"
			      :weight bold))))
  :config
  (dashboard-setup-startup-hook))

;(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(defface nav-face '((nil (:family "Fira Code Medium"
				:foundry "CTDB" 
				:height 190 
				:foreground "#FF628E"
				:weight black)))
  "Face used for no items."
  :group 'dashboard)

(defface nav-icon-face '((nil (:family "Fira Code Medium"
				     :foundry "CTDB" 
				     :height 190 
				     :foreground "white"
				     :weight black)))
  "Face used for no items."
  :group 'dashboard)

(setq dashboard-path-style 'truncate-middle
      dashboard-path-max-length 48)

;; Format: "(icon title help action face prefix suffix)"
(setq dashboard-navigator-buttons
      `((("[m]" "Mail" "Check mails" (lambda () (+ 0 0))
	  'nav-face
	  'nav-icon-face)
	 ("[a]" "Agenda" "Check mails" (lambda () (+ 0 0))
	  'nav-face
	  'nav-icon-face)
	 ("[s]" "Scratch" "Check mails" (lambda () (+ 0 0))
	  'nav-face
	  'nav-icon-face))))

(setq dashboard-items '((recents  . 5)))

;; Ignore surrounding white space on selection
(defun my-hl-line-range-function ()
  (let ((beg (save-excursion
           (back-to-indentation)
           (point)))
        (end (save-excursion
           (end-of-visual-line)
           (point))))
    (cons beg end)))


(defun selection-hl ()
  (when (derived-mode-p  'dashboard-mode)
	;; Activate selection highlighting
	(setq hl-line-range-function #'my-hl-line-range-function)
	(hl-line-mode t)
	(forward-char)
	;; Hide cursor
	(setq cursor-type nil)))

(add-hook 'focus-in-hook
 (lambda () (selection-hl)))
