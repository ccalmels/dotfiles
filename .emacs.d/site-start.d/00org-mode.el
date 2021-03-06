;;; org-mode
(require 'org)

(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)

;; file to save todo items
(setq org-agenda-files (list "~/todos.org"))

;; open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;; add CLOSED: date
(setq org-log-done 'time)

;; capture template
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/todos.org" "Tasks")
	 "* TODO [#A] %i%?\n  CREATED: %U\n")
	("l" "todo (with link)" entry (file+headline "~/todos.org" "Tasks")
         "* TODO [#A] %i%?\n  CREATED: %U\n  LINK: %a\n")))

(advice-add 'org-agenda-quit :before 'org-save-all-org-buffers)

(defun cc/org-capture-with-link () (interactive) (org-capture nil "l"))
