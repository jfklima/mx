(use-package perspective
  :disabled t
  :config
  (setq persp-file-name (concat user-emacs-directory ".perspectives")
	persp-state-default-file persp-file-name
	persp-interactive-completion-function 'ido-completing-read
	persp-sort 'access)

  (defun mx-persp-switch-main ()
    "Acessa rapidamente a persp MAIN."
    (interactive)
    (if (member "main" (persp-names))
	(persp-switch "main")
      (message "ERROR MAIN NOT ACCESS")))

  (lmap
    "l" '(:def nil :wk "layouts")
    "l m" '(:def mx-persp-switch-main :wk "switch-persp-main")
    "l s" '(:def persp-switch :wk "switch-layout")
    "l R" '(:def persp-rename :wk "rename-layout")
    "l K" '(:def persp-kill :wk "kill-layout")
    "l p" '(:def persp-prev :wk "previous-layout")
    "l n" '(:def persp-next :wk "next-layout")
    ;; "l a" '(:def persp-add-buffer :wk "add-buffer")
    ;; "l d" '(:def persp-remove-buffer :wk "delete-buffer")
    ;; "l A" '(:def persp-set-buffer :wk "set-buffer")
    "l S" 'persp-state-save
    "l L" 'persp-state-load)

  (add-hook 'persp-created-hook 'persp-state-save)

  (add-hook 'kill-emacs-hook 'persp-state-save)
  (add-hook 'emacs-startup-hook '(lambda () (persp-state-load persp-file-name)))

  (persp-mode))


(provide 'init-perspective)
