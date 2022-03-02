(use-package centaur-tabs
  :demand t
  :config
  (setq centaur-tabs-style 'bar
	centaur-tabs-height 32
	centaur-tabs-set-icons t
	centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-set-bar 'left
	centaur-tabs-set-close-button nil
	centaur-tabs-set-modified-marker t
	centaur-tabs-cycle-scope 'tabs
	centaur-tabs-show-count t
	centaur-tabs-label-fixed-length 0)

  (centaur-tabs-headline-match)
  (centaur-tabs-change-fonts "arial" 140)

(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (cl-dolist (prefix centaur-tabs-excluded-prefixes)
       (when (string-prefix-p prefix name)
	 (cl-return t)))

     (not (file-name-extension name))

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
	  (not (file-name-extension name)))
     )))

  (defun centaur-tabs-buffer-groups ()
  "`centaur-tabs-buffer-groups' control buffers' group rules.

Group centaur-tabs with mode if buffer is derived from `eshell-mode'
`emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.  All buffer
name start with * will group to \"Emacs\".  Other buffer group by
`centaur-tabs-get-group-name' with project name."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "EMACS")

    ((derived-mode-p 'magit-mode)
     "MAGIT")

    ((derived-mode-p 'org-mode)
     "ORGANIZADOR")

    ((derived-mode-p 'emacs-lisp-mode)
     "CONFIG")

    ((derived-mode-p 'lisp-interaction-mode)
     "CONFIG")

    ((derived-mode-p 'prog-mode)
     (projectile-project-name))

    ((derived-mode-p 'text-mode)
     (projectile-project-name))

    ((derived-mode-p 'dired-mode)
     "DIRED")

    (t
     (centaur-tabs-get-group-name (current-buffer))
     ))))


  (centaur-tabs-mode t)
  :config
  (emap
    "C-n" 'centaur-tabs-forward-tab
    "C-p" 'centaur-tabs-backward-tab
    "M-n" 'centaur-tabs-forward-tab
    "M-p" 'centaur-tabs-backward-tab)
  (lmap
    "b l" '(:def centaur-tabs-switch-group :wk "list-groups")
    "b U" '(:def centaur-tabs-kill-other-buffers-in-current-group
		 :wk "unique-buffer")
    "b C" '(:def centaur-tabs-kill-all-buffers-in-current-group :wk "close-all")
    "b K" '(:def centaur-tabs-kill-unmodified-buffers-in-current-group
		 :wk "delete-unmodified")
    "b >" 'centaur-tabs-select-end-tab
    "b <" 'centaur-tabs-select-beg-tab)
  :bind
  ("C-c l" . centaur-tabs-switch-group)
  ("M-<up>" . centaur-tabs-backward-group)
  ("M-<down>" . centaur-tabs-forward-group)
  ("M-<left>" . centaur-tabs-backward)
  ("M-<right>" . centaur-tabs-forward))

(provide 'init-centaur-tabs)
