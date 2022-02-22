(use-package magit 
  :demand t
  :config
  (lmap
    "g" '(:def nil :wk "git")
    "g s" '(:def magit-status :wk "git status")
    "g l" '(:def magit-dispatch :wk "list-commands")))


(use-package projectile 
  :config
  (projectile-mode +1)
  (setq projectile-completion-system 'helm)
  (setq projectile-project-search-path '("~/workspace/"))
  (lmap
    "p" '(:def nil :wk "projects")
    "p p" '(:def projectile-command-map :wk "command-map")
    "p q" '(:def projectile-switch-project :wk "switch-project")
    "p o" '(:def projectile-switch-open-project :wk "switch-open-project")
    "p d" 'neotree-projectile-action
    "p f" '(:def projectile-find-file :wk "find-file")
    "p b" '(:def projectile-switch-to-buffer :wk "switch-to-buffer")
    "p r" '(:def projectile-recentf :wk "recentf")
    "p s" '(:def projectile-run-eshell :wk "eshell")))


(use-package neotree 
  :init
  (lmap
    "d" '(:def nil :wk "directory")
    "d d" 'neotree-toggle)

  :config
  (setq neo-window-fixed-size nil
	neo-smart-open t
	neo-window-width 30
	neo-theme (if (display-graphic-p) 'icons 'arrow))

  :bind (:map neotree-mode-map
	      ("c" . neotree-create-node)
	      ("d" . neotree-delete-node)
	      ("r" . neotree-rename-node)
	      ("x" . neotree-copy-node)
	      ("]" . scroll-other-window)
	      ("[" . scroll-other-window-down)
	      ("o" . other-window)
	      ("RET" . neotree-quick-look)))


(use-package perspective 
  :config
  (setq persp-modestring-short t
	persp-file-name (concat user-emacs-directory ".perspectives")
	persp-state-default-file persp-file-name
	persp-interactive-completion-function 'ido-completing-read
	persp-sort 'created)

  (lmap
    "l" '(:def nil :wk "layouts")
    "l s" '(:def persp-switch :wk "switch-layout")
    "l R" '(:def persp-rename :wk "rename-layout")
    "l K" '(:def persp-kill :wk "kill-layout")
    "l p" '(:def persp-prev :wk "previous-layout")
    "l n" '(:def persp-next :wk "next-layout")
    "l a" '(:def persp-add-buffer :wk "add-buffer")
    "l d" '(:def persp-remove-buffer :wk "delete-buffer")
    "l A" '(:def persp-set-buffer :wk "set-buffer"))

  (add-hook 'kill-emacs-hook 'persp-state-save)
  (add-hook 'emacs-startup-hook '(lambda () (persp-state-load persp-file-name)))

  (persp-mode))


(provide 'manager-projects)
