(use-package python
  :ensure nil
  :hook
  (python-mode . electric-pair-local-mode))


;; (use-package lsp-pyright
  ;; :disabled t
  ;; :hook (python-mode . (lambda ()
			  ;; (require 'lsp-pyright)
			  ;; (lsp)))
  ;; :config
  ;; (setq lsp-pyright-disable-language-services nil
	;; lsp-pyright-diagnostic-mode "workspace"
	;; lsp-pyright-python-executable-cmd "python3"))

(provide 'init-python-mode)
