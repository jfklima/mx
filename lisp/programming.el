(use-package elisp-mode
  :ensure nil
  :config
  (mmap :keymaps 'emacs-lisp-mode-map
    "f" 'eval-defun
    "x" 'eval-last-sexp
    "i" 'helm-imenu)
  (mmap :keymaps 'lisp-interaction-mode-map
    "x" 'eval-last-sexp
    "f" 'eval-defun))


(use-package flycheck
  :commands flycheck-mode
  :config
  (lmap
    "e" '(:def nil :wk "erros")
    "e n" 'flycheck-next-error
    "e p" 'flycheck-previous-error))


(use-package lsp-mode
  :init
  ;; Performance
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  :hook (lsp-mode . flycheck-mode)
  :commands lsp
  :config
  (setq lsp-diagnostics-provider :flycheck))


(use-package lsp-ui
  :config

  (setq lsp-ui-sideline-enable nil
	lsp-headerline-breadcrumb-enable nil
	lsp-ui-doc-delay 2.0
	lsp-ui-doc-show-with-cursor t
	lsp-ui-doc-position 'at-point
	lsp-ui-doc-alignment 'window))


(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp)))
  :config
  (setq lsp-pyright-disable-language-services nil
	lsp-pyright-diagnostic-mode "workspace"
	lsp-pyright-python-executable-cmd "python3"))



(use-package python
  :ensure nil
  :hook
  (python-mode . electric-pair-local-mode))


(provide 'programming)
