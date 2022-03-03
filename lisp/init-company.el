(use-package company
  :demand t
  :hook
  (emacs-lisp-mode . company-mode)
  (python-mode . company-mode)
  :init
  ;; (add-hook 'after-init-hook 'company-tng-mode)
  (imap "TAB" 'company-complete)

  :config

  (setq completion-ignore-case t
	company-tooltip-align-annotations t
	company-minimum-prefix-length 3
	;; company-frontends '(company-tng-frontend company-box-frontend)
	company-selection-wrap-around t
	company-idle-delay 0.0)

  ;; (add-hook 'python-mode-hook '(lambda () (setq-local company-minimum-prefix-length 1)))

  (let ((map company-active-map))

    (define-key map (kbd "M-l") 'company-select-previous)
    (define-key map (kbd "C-l") 'company-select-previous)

    (define-key map (kbd "C-j") 'company-complete-common)
    (define-key map (kbd "M-j") 'company-complete-common)

    (define-key map (kbd "M-k") 'company-abort)
    (define-key map (kbd "C-k") 'company-abort))
  )

    ;; (global-company-mode +1))


(provide 'init-company)
