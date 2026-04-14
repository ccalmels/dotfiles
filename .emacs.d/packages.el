(use-package exec-path-from-shell
  :if (daemonp)
  :config (exec-path-from-shell-initialize))

(use-package treesit
  :config
  (setq treesit-language-source-alist
	'((rust "https://github.com/tree-sitter/tree-sitter-rust.git/")
	  (python "https://github.com/tree-sitter/tree-sitter-python")
	  (cmake "https://github.com/uyha/tree-sitter-cmake")
	  (yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml")
	  (c "https://github.com/tree-sitter/tree-sitter-c")
	  (cpp "https://github.com/tree-sitter/tree-sitter-cpp")))
  (setq major-mode-remap-alist
	'((python-mode . python-ts-mode)
	  (cmake-mode . cmake-ts-mode)
	  (yaml-mode . yaml-ts-mode)
	  (c-mode . c-ts-mode)
	  (c++-mode . c++-ts-mode)
	  (c-or-c++-mode . c-or-c++-ts-mode)))
  (dolist (lang treesit-language-source-alist)
    (unless (treesit-language-available-p (car lang))
      (treesit-install-language-grammar (car lang)))))

(use-package which-key
  :config (which-key-mode))

(use-package windmove
  :custom
  (windmove-wrap-around t)
  :config
  (windmove-default-keybindings 'meta))

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
  :custom
  (magit-define-global-key-bindings 'recommended)
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

(use-package eglot
  :hook
  ((python-base-mode rust-mode c++-ts-mode c-ts-mode) . eglot-ensure)
  :custom
  (eglot-events-buffer-config '(:size 0 :format full))
  (eglot-autoshutdown t)
  :config
  (add-to-list 'eglot-server-programs '(python-base-mode . ("ruff" "server")))
  (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer" :initializationOptions
						     (:check (:command "clippy"))))))
