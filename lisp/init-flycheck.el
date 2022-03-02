(use-package flycheck
  :commands flycheck-mode
  ;; :hook
  ;; (emacs-lisp-mode . flycheck-mode)
  ;; (python-mode . flycheck-mode)
  ;; (cc-mode . flycheck-mode)

  :config
  (flycheck-mode 1)
  (lmap
    "e" '(:def nil :wk "erros")
    "e n" 'flycheck-next-error
    "e p" 'flycheck-previous-error))


(provide 'init-flycheck)
