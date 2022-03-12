(use-package lsp-mode
  :commands lsp)


;; extensions
(use-package lsp-ui :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil
	lsp-ui-doc-show-with-cursor nil
	lsp-ui-peek-enable nil
	lsp-headerline-breadcrumb-enable nil
	lsp-ui-doc-position 'top ; bottom ; at-point
	lsp-ui-doc-alignment 'frame
	))

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package flycheck
  :hook (lsp-mode . flycheck-mode)
  :config
  (lmap
    "e" '(:def nil :wk "erros")
    "e n" 'flycheck-next-error
    "e p" 'flycheck-previous-error))


;; langs server
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
			  (require 'lsp-pyright)
			  (lsp))))

;; (use-package company-box
;;   :disabled t
;;   :hook (company-mode . company-box-mode)
;;   :config
;;   (setq company-box-show-single-candidate 'when-no-other-frontend ;never
;;	))
	;; company-box-frame-behavior 'point))


(provide 'init-lsp)
