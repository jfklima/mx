(use-package magit
  :demand t
  :config
  (lmap
    "g" '(:def nil :wk "git")
    "g s" '(:def magit-status :wk "git status")
    "g l" '(:def magit-dispatch :wk "list-commands")))

(provide 'init-magit)
