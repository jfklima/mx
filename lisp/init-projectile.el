(use-package projectile
  :demand t
  :config

  (setq projectile-completion-system 'helm
	projectile-switch-project-action 'projectile-find-file
	projectile-project-search-path '("~/workspace/"
					 "~/init_macs"
					 "~/Repositorios"))

  (defun mx-neotree-projectile-action ()
    (interactive)
    (neotree-projectile-action)
    (neotree-collapse-all))

  (lmap
    "p" '(:def nil :wk "projects")
    "p b" 'projectile-switch-to-buffer
    "p p" '(:def projectile-command-map :wk "commands")
    "p q" '(:def projectile-switch-project :wk "switch-project")
    "p o" '(:def centaur-tabs-switch-group :wk "switch-open-project")
    "p d" '(:def mx-neotree-projectile-action :wk "ROOT-DIR")
    "p f" '(:def projectile-find-file :wk "find-file")
    "p b" '(:def projectile-switch-to-buffer :wk "switch-to-buffer")
    "p r" '(:def projectile-recentf :wk "recentf")
    "p s" '(:def projectile-run-eshell :wk "eshell"))

    (projectile-mode +1))


(provide 'init-projectile)
