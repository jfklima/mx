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


(provide 'init-neotree)
