(use-package lsp-mode
  :disabled t
  :commands lsp
  :hook (lsp-mode . flycheck-mode)

  :config
  (setq lsp-diagnostics-provider :flycheck))


(use-package lsp-ui
  :disabled t
  :hook (lsp-mode . lsp-ui-mode)
  :after lsp-mode
  :config

  (setq lsp-ui-doc-enable t
	lsp-ui-sideline-enable nil
	lsp-headerline-breadcrumb-enable nil
	lsp-ui-doc-delay 3.0
	lsp-ui-doc-show-with-cursor t
	lsp-ui-doc-position 'top
	lsp-ui-doc-alignment 'window))


(provide 'init-lsp)
