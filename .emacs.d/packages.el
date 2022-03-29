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
  (whitespace-style '(face trailing lines-tail indentation))
  :hook
  (prog-mode . whitespace-mode))

(use-package magit
  :ensure
  :bind ("C-x g" . magit-status))

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

(use-package lsp-mode
  :custom
  (lsp-keymap-prefix "M-l")
  ;; (lsp-enable-symbol-highlighting nil)
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  (python-mode . lsp))

(use-package lsp-ui
  :hook
  (lsp-mode . lsp-ui-mode)
;;    ;; :custom
;;    ;; (lsp-ui-doc-enable nil)
;;    ;; (lsp-ui-imenu-enable nil)
  :bind
  (:map lsp-ui-mode-map
	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
	([remap xref-find-references] . lsp-ui-peek-find-references)))
