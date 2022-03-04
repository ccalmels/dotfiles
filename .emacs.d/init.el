;;; Emacs stuff

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
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

;;; use shift+arrows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;; whitespace mode
(require 'whitespace)
(setq-default whitespace-style '(face trailing lines-tail indentation))
(add-hook 'prog-mode-hook 'whitespace-mode)

;;; Aspect
(menu-bar-mode -1)

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

;;; Compile all .el files
;;;(byte-recompile-directory user-emacs-directory 0)

;;; add subdirectories to load-path
(let ((default-directory (concat user-emacs-directory "lisp")))
    (normal-top-level-add-subdirs-to-load-path))

;;; rscope
(when (executable-find "cscope")
    (require 'rscope nil 'noerror))

;;; MaGit
(when (require 'magit nil 'noerror)
  (global-set-key (kbd "C-x g") 'magit-status))

;;; password store
(when (executable-find "pass")
  (when (require 'auth-source-pass nil 'noreror)
    (auth-source-pass-enable)))

;;; GLSL mode
(autoload 'glsl-mode "glsl-mode" nil t)

;;; Split configuration
(debian-run-directories (concat user-emacs-directory "/site-start.d"))

;;; Customization
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load (concat user-emacs-directory "packages.el") 'noerror)

;;; Local Variables:
;;; after-save-hook: (lambda () (byte-compile-file buffer-file-name))
;;; End:
