;;; mu4e
(let ((mu4e-accounts-file "~/.emacs.d/mu4e-accounts.el"))
  (when (file-exists-p mu4e-accounts-file)

    (require 'mu4e)

    (setq
     mu4e-get-mail-command "mbsync -a"
     mu4e-compose-dont-reply-to-self 't
     mu4e-view-show-addresses 't
     mu4e-view-show-images 't
     mu4e-change-filenames-when-moving 't
     mu4e-attachment-dir "/tmp"
     mu4e-compose-context-policy 'ask-if-none
     mu4e-context-policy 'pick-first
     mu4e-update-interval 1800
     mail-user-agent 'mu4e-user-agent
     message-kill-buffer-on-exit t
     message-send-mail-function 'smtpmail-send-it
     smtpmail-stream-type 'starttls
     smtpmail-smtp-service 587)

    (add-to-list 'mu4e-view-actions '("ViewInBrowser" . mu4e-action-view-in-browser) t)

    (load mu4e-accounts-file)

    (if (version< mu4e-mu-version "1.4")
	(progn
	  (delete '("mime:image/*" "Messages with images" 112) mu4e-bookmarks)
	  (add-to-list 'mu4e-bookmarks
		       (make-mu4e-bookmark
			:name "Personal unread messages"
			:query "flag:unread AND NOT flag:trashed AND NOT maildir:/amelia/*"
			:key ?p))

	  ;; This sets `mu4e-user-mail-address-list' to the concatenation of all
	  ;; `user-mail-address' values for all contexts. If you have other mail
	  ;; addresses as well, you'll need to add those manually.
	  (setq mu4e-user-mail-address-list
		(delq nil
		      (mapcar (lambda (context)
				(when (mu4e-context-vars context)
				  (cdr (assq 'user-mail-address (mu4e-context-vars context)))))
			      mu4e-contexts)))
	  )
      (delete '(:name "Messages with images" :query "mime:image/*" :key 112) mu4e-bookmarks)
      (add-to-list 'mu4e-bookmarks
		   '( :name "Personal unread messages"
			    :query "flag:unread AND NOT flag:trashed AND NOT maildir:/amelia/*"
			    :key ?p))
      )

    ;; todo interaction
    (require 'org-mu4e)

    (define-key mu4e-headers-mode-map (kbd "C-c c") 'cc/org-capture-with-link)
    (define-key mu4e-view-mode-map    (kbd "C-c c") 'cc/org-capture-with-link)
    ))
