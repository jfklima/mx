(use-package helm
  :demand t
  :config
  (require 'helm-config)

  (setq helm-command-prefix-key "C-x c"
	helm-move-to-line-cycle-in-source t)

  (lmap
    "h" helm-command-map)

  (define-key helm-map (kbd "<tab>") 'helm-next-line)
  (define-key helm-map (kbd "C-j") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i")  'helm-select-action)

  (setq helm-autoresize-max-height 60)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)

  (helm-mode 1))


(use-package ido
  :ensure nil
  :config

  (setq ido-enable-flex-matching t
	;; ido-ignore-extensions t
	ido-cannot-complete-command 'ido-next-match
	ido-max-window-height 0.5
	ido-ignore-buffers '("\\` " "^*.+*")

	ido-default-buffer-method 'select-window)

  (setq ido-decorations (quote ("\n-> "
				""
				"\n "
				"\n ..."
				"[" "]"
				" [No match]"
				" [Matched]"
				" [Not readable]"
				" [Too big]"
				" [Confirm]")))
  (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

  (ido-mode 1))

(provide 'interactive)
