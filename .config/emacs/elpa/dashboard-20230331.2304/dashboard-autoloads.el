;;; dashboard-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "dashboard" "dashboard.el" (0 0 0 0))
;;; Generated autoloads from dashboard.el

(autoload 'dashboard-open "dashboard" "\
Open (or refresh) the *dashboard* buffer.

\(fn &rest _)" t nil)

(autoload 'dashboard-setup-startup-hook "dashboard" "\
Setup post initialization hooks.
If a command line argument is provided, assume a filename and skip displaying
Dashboard." nil nil)

(register-definition-prefixes "dashboard" '("dashboard-"))

;;;***

;;;### (autoloads nil "dashboard-widgets" "dashboard-widgets.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from dashboard-widgets.el

(register-definition-prefixes "dashboard-widgets" '("dashboard-" "org-time-less-p" "recentf-list"))

;;;***

;;;### (autoloads nil nil ("dashboard-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; dashboard-autoloads.el ends here
