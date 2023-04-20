;;; Emacs stuff

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(set-language-environment "UTF-8")

;;; Keyboard shortcut
(global-set-key (kbd "<delete>")    'delete-char)
(global-set-key (kbd "<kp-delete>") 'delete-char)
(global-set-key (kbd "C-z")         'undo)
(global-set-key (kbd "C-l")         'goto-line)
(global-set-key (kbd "M-r")         'revert-buffer)
(global-set-key (kbd "M-%")         'query-replace-regexp)
(global-set-key (kbd "<home>")      'beginning-of-buffer)
(global-set-key (kbd "<end>")       'end-of-buffer)
(global-set-key (kbd "M-RET")       'push-button)

;;; Aspect
(menu-bar-mode -1)

;;; Mouse support
(xterm-mouse-mode)

(setq-default
 gdb-many-windows t
 column-number-mode t
 inhibit-startup-screen t
 indent-tabs-mode t
 require-final-newline t
 tramp-default-method "ssh"
 tramp-use-ssh-controlmaster-options nil
 auth-source-save-behavior nil)

;;; Custom exit
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

;; C-style
(add-hook 'c-mode-common-hook
	  (lambda() (c-set-style "linux")))
(add-hook 'c++-mode-hook
	  (lambda() (c-set-offset 'innamespace 0)))

;;; highligth
(show-paren-mode t)
(setq show-paren-style 'mixed)
(global-hl-line-mode t)

;;; Saved files
(setq backup-directory-alist `(("." . "~/.saves")))

;;; Customization
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load (concat user-emacs-directory "packages"))

;;; Split configuration
(let ((split-dir (concat user-emacs-directory "site-start.d")))
;;  (byte-recompile-directory split-dir 0)
  (debian-run-directories split-dir))

;;; Local Variables:
;;; after-save-hook: (lambda () (byte-compile-file buffer-file-name))
;;; End:
