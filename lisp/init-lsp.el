(use-package lsp-mode
  :commands lsp
  :hook (lsp-mode . flycheck-mode)
  :init
  ;; Performance
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  :config
  (setq lsp-diagnostics-provider :flycheck))


(use-package lsp-ui
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
