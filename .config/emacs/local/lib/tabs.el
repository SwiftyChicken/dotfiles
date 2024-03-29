(use-package centaur-tabs
  :demand
  :custom
  (centaur-tabs-style "bar")
  (centaur-tabs-height 44)
  (centaur-tabs-label-fixed-length 25)
  (centaur-tabs-set-icons t)
  (centaur-tabs-cycle-scope 'tabs)
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  :config
  ; GROUPS
  (defun centaur-tabs-buffer-groups ()
    "`centaur-tabs-buffer-groups' control buffers' group rules.

Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `centaur-tabs-get-group-name' with project name."
    (list
     (cond
      ((or (string-equal "*" (substring (buffer-name) 0 1))
	   (memq major-mode '(magit-process-mode
			      magit-status-mode
			      magit-diff-mode
			      magit-log-mode
			      magit-file-mode
			      magit-blob-mode
			      magit-blame-mode
			      )))
       "Emacs")
      ((derived-mode-p 'prog-mode)
       "Editing")
      ((derived-mode-p 'dired-mode)
       "Dired")
      ((memq major-mode '(helpful-mode
			  help-mode))
       "Help")
      ((memq major-mode '(org-mode
			  org-agenda-clockreport-mode
			  org-src-mode
			  org-agenda-mode
			  org-beamer-mode
			  org-indent-mode
			  org-bullets-mode
			  org-cdlatex-mode
			  org-agenda-log-mode
			  diary-mode))
       "OrgMode")
      (t
         "Uhm IDK Group"
       ;(centaur-tabs-get-group-name (current-buffer))
       ))))
  ; START CENTAUR *HORSE NOISES*
  (centaur-tabs-mode t))

(centaur-tabs-headline-match)
