(use-package projectile-rails
  :config
  (lmap
    "l" '(:def nil :wk "locale")

    "l l" '(:def projectile-rails-command-map :wk "locate-rails-commands")

    "l f" '(:def projectile-rails-find-controller :wk "find-resource")

    "l m" '(:def projectile-rails-find-current-model :wk "locate-model")
    "l M" '(:def projectile-rails-find-model :wk "locate-all-models")

    "l c" '(:def projectile-rails-find-current-controller :wk "locate-controller")
    "l C" '(:def projectile-rails-find-controller :wk "locate-all-controllers")

    "l v" '(:def projectile-rails-find-current-view :wk "locate-view")
    "l V" '(:def projectile-rails-find-view :wk "locate-all-views")

    "l t" '(:def projectile-rails-find-current-test :wk "locate-test")
    "l T" '(:def projectile-rails-find-test :wk "locate-all-tests")

    "l n" '(:def projectile-rails-find-current-migration :wk "locate-migration")
    "l n" '(:def projectile-rails-find-migration :wk "locate-all-migrations")

    "l R" '(:def projectile-rails-goto-routes :wk "locate-routes")
    "l G" '(:def projectile-rails-goto-gemfile :wk "locate-gemfile")
    "l D" '(:def projectile-rails-goto-schema :wk "locate-schema")
    ))

(provide 'init-rails-mode)
