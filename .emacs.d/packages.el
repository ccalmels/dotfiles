(use-package exec-path-from-shell
  :if (daemonp)
  :ensure
  :config (exec-path-from-shell-initialize))

(use-package which-key
  :ensure
  :config (which-key-mode))

(use-package windmove
  :ensure
  :custom
  (windmove-wrap-around t)
  :config
  (windmove-default-keybindings)
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right))

(use-package whitespace
  :ensure
  :custom
  (whitespace-line-column 100)
  (whitespace-style '(face trailing lines-tail indentation))
  :hook
  (prog-mode . whitespace-mode))

(use-package magit
  :ensure
  :bind ("C-x g" . magit-status)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package company
  :ensure
  :config (global-company-mode))

(use-package auth-source-pass
  :if (executable-find "pass")
  :config (auth-source-pass-enable))

(use-package rscope
  :if (executable-find "cscope")
  :load-path "lisp/rscope")

(use-package dts-mode
  ;; for Zephyr DTS overlay
  :mode "\\.overlay\\'")

(use-package kconfig-mode)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :custom
  (lsp-keymap-prefix "M-l")
  (lsp-pylsp-plugins-autopep8-enabled t)
  :hook
  (python-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui
  :hook
  (lsp-mode . lsp-ui-mode)
  :bind
  (:map lsp-ui-mode-map
	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
	([remap xref-find-references] . lsp-ui-peek-find-references)))
