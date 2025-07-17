(use-package exec-path-from-shell
  :if (daemonp)
  :config (exec-path-from-shell-initialize))

(use-package treesit
  :config
  (setq treesit-language-source-alist
	'((rust . ("https://github.com/tree-sitter/tree-sitter-rust.git/" "v0.23.3"))
	  (python "https://github.com/tree-sitter/tree-sitter-python")))
  (setq major-mode-remap-alist
	'((python-mode . python-ts-mode))))


(use-package cmake-ts-mode
  :init (add-to-list 'treesit-language-source-alist
		     '(cmake "https://github.com/uyha/tree-sitter-cmake")))

(use-package yaml-ts-mode
  :init (add-to-list 'treesit-language-source-alist
		     '(yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml")))

(use-package which-key
  :config (which-key-mode))

(use-package windmove
  :custom
  (windmove-wrap-around t)
  :config
  (windmove-default-keybindings)
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right))

(use-package whitespace
  :custom
  (whitespace-line-column 100)
  (whitespace-style '(face trailing lines-tail empty indentation))
  :hook
  (prog-mode . whitespace-mode))

(use-package editorconfig
  :config
  (editorconfig-mode))

(use-package magit
  :bind ("C-x g" . magit-status)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package company
  :config (global-company-mode))

(use-package auth-source-pass
  :if (executable-find "pass")
  :config (auth-source-pass-enable))

(use-package rscope
  :if (executable-find "cscope")
  :load-path "lisp/rscope")

(use-package rust-mode
  :custom
  (rust-mode-treesitter-derive t))

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
