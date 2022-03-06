(use-package company
  :demand t
  :hook
  (prog-mode . company-mode)

  :init
  (imap "TAB" 'company-complete)

  :config
  (setq completion-ignore-case t
	company-tooltip-align-annotations t
	company-minimum-prefix-length 3
	company-selection-wrap-around t)

  )


(provide 'init-company)
