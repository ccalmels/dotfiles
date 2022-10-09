(let ((mu4e-accounts-file "~/.emacs.d/mu4e-accounts.el"))
  (use-package mu4e
    :if (file-exists-p mu4e-accounts-file)
    :custom
    (mu4e-get-mail-command "mbsync -a")
    (mu4e-compose-dont-reply-to-self 't)
    (mu4e-view-show-addresses 't)
    (mu4e-view-show-images 't)
    (mu4e-change-filenames-when-moving 't)
    (mu4e-attachment-dir "/tmp")
    (mu4e-compose-context-policy 'ask-if-none)
    (mu4e-context-policy 'pick-first)
    (mu4e-update-interval 1800)
    (mu4e-maildir-shortcuts
     '((:maildir "/free/Archive" :key ?f)
       (:maildir "/hotmail/Archivage" :key ?h)))
    (mail-user-agent 'mu4e-user-agent)
    (message-kill-buffer-on-exit t)
    (message-send-mail-function 'smtpmail-send-it)
    (smtpmail-stream-type 'starttls)
    (smtpmail-smtp-service 587)
    :config
    (load mu4e-accounts-file)
    (delete '(:name "Messages with images" :query "mime:image/*" :key 112)
	    mu4e-bookmarks)))

(use-package mu4e-org
  :requires (org mu4e)
  :bind
  (:map mu4e-headers-mode-map ("C-c c" . 'cc/org-capture-with-link)
   :map mu4e-view-mode-map    ("C-c c" . 'cc/org-capture-with-link)))
