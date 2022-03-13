(use-package ido :ensure nil
  :config
  (setq ido-enable-flex-matching t
	ido-max-window-height 0.8
	ido-cannot-complete-command 'ido-next-match
	ido-default-buffer-method 'selected-window)

  (setq ido-ignore-buffers '("\\` "
			     "^*"
			     "magit"))

  (setq ido-decorations (quote ("\n-> "
				""
				"\n "
				"\n ..."
				"["
				"]"
				" [No match]"
				" [Matched]"
				" [Not readable]"
				" [Too big]"
				" [Confirm]")))

  (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

  (defun ido-my-keys ()
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match))
  (add-hook 'ido-setup-hook 'ido-my-keys)

  (lmap
    "f i" '(:def (lambda ()
		   (interactive)
		   (ido-find-file-in-dir (concat user-emacs-directory "lisp")))
		 :wk "configuration")
    )

  (ido-mode 1))

(provide 'init-ido)
