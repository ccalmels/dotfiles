(use-package org
  :custom
  (org-agenda-files (list "~/Org/todos.org"))
  ;; open agenda in current window
  (org-agenda-window-setup (quote current-window))
  (org-agenda-custom-commands
   '(("w" "Week span" ((agenda "" ((org-agenda-start-on-weekday nil)
				   (org-agenda-span 10)
				   (org-agenda-start-day "-3d")))))))
  ;; add CLOSED: date
  (org-log-done 'time)
  ;; capture template matching Orgzly
  (org-capture-templates
   '(("t" "Todo" entry (file "~/Org/todos.org")
      "* TODO [#A] %i%?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n" :empty-lines 1)
     ("l" "Todo (with link)" entry (file "~/Org/todos.org")
      "* TODO [#A] %i%?\n  :PROPERTIES:\n  :CREATED: %U\n  :LINK: %a\n  :END:\n" :empty-lines 1)))
  ;; force org-indent-mode
  (org-startup-indented t)
  :config
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  (defun cc/org-capture-with-link () (interactive) (org-capture nil "l"))
  :bind
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture))
