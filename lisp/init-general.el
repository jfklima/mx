(use-package general
  :after multistate
  :config
  (general-create-definer emap :keymaps edit-map)
  (general-create-definer imap :keymaps insert-map)
  (general-create-definer vmap :keymaps mark-map)
  (general-create-definer rmap :keymaps replace-map)
  (general-create-definer umap :keymaps uppercase-map)
  (general-create-definer lmap :keymaps edit-map :prefix "SPC")
  (general-create-definer mmap :keymaps edit-map :prefix "SPC m")

  :bind
  (:map insert-map
	("<return>" . edit-state)
	("M-u" . uppercase-state))

  (:map edit-map
	("i" . insert-state)
	("R" . replace-state)
	("<return>" . mark-state)
	("M-u" . uppercase-state))

  (:map mark-map
	("<return>" . edit-state))

  (:map replace-map
	("<return>" . edit-state))

  (:map uppercase-map
	("<return>" . edit-state)
	("M-i" . insert-state)))

(provide 'init-general)
