(use-package multistate
  :hook
  (prog-mode . multistate-mode)
  (text-mode . multistate-mode)

  ;; enable selection is Select state
  (multistate-select-state-enter . (lambda () (set-mark (point))))
  (multistate-select-state-exit .  deactivate-mark)

  ;; enable overwrite-mode in Replace state
  (multistate-replace-state-enter . overwrite-mode)
  (multistate-replace-state-exit .  (lambda () (overwrite-mode 0)))

  (multistate-uppercase-state-enter . caps-lock-mode)
  (multistate-uppercase-state-exit . (lambda () (caps-lock-mode 0)))

  :init
  (use-package caps-lock)

  ;; Emacs state
  (multistate-define-state 'emacs :lighter "Emacs")

  ;; Insert state
  (multistate-define-state
   'insert
   :lighter "INSERTING"
   :cursor '(bar . 4)
   :parent 'multistate-emacs-state-map)

  ;; Edit state
  (multistate-define-state
   'edit
   :default t
   :lighter "EDITING"
   :parent 'multistate-suppress-map)

  (add-hook 'deactivate-mark-hook 'edit-state)

  :config

    ;; define a cor do cursos para amarelo
  (when (multistate-mode)
    (custom-set-faces
     '(cursor ((t (:background "#Ffff00"
			       :foreground "#272822"
			       :inverse-video t))))))

  ;; Replace state
  (multistate-define-state
   'replace
   :lighter "REPLACING"
   :cursor 'hbar)

  ;; Select state
  (multistate-define-state
   'select
   :lighter "SELECTING"
   :cursor 'hollow
   :parent 'multistate-edit-state-map)

  ;; Upper state
  (multistate-define-state
   'uppercase
   :lighter "UPPERTING"
   :cursor '(hbar . 8)
   :parent 'multistate--emacs-state-map)

  (defun edit-state () (interactive) (multistate-edit-state))
  (defun insert-state () (interactive) (multistate-insert-state))
  (defun select-state () (interactive) (multistate-select-state))
  (defun replace-state () (interactive) (multistate-replace-state))
  (defun uppercase-state () (interactive) (multistate-uppercase-state))

  (defvar edit-map 'multistate-edit-state-map)
  (defvar insert-map 'multistate-insert-state-map)
  (defvar select-map 'multistate-select-state-map)
  (defvar replace-map 'multistate-replace-state-map)
  (defvar uppercase-map 'multistate-uppercase-state-map)


  (defun multistate-change-cursor-color ()
    "Modifica a cor do curso conforme o status."
    (cond 
	  ((multistate-insert-state-p)
	   (custom-set-faces
	    '(cursor ((t (:background "#Ffffff"
				      :foreground "#272822"
				      :inverse-video t))))))
	  ((multistate-uppercase-state-p)
	   	   (custom-set-faces
		    '(cursor ((t (:background "#0000cd"
					      :foreground "#272822"
      					      :inverse-video t))))))
	  (t
	   ;; muda a cor do cursor para amarelo
	   (custom-set-faces
	    '(cursor ((t (:background "#Ffff00"
				   :foreground "#272822"
				   :inverse-video t))))))))

  (add-hook 'multistate-change-state-hook 'multistate-change-cursor-color)


  (global-set-key (kbd "M-m") 'multistate-mode))


(use-package general
  :after multistate
  :config
  (general-create-definer emap :keymaps edit-map)
  (general-create-definer imap :keymaps insert-map)
  (general-create-definer smap :keymaps select-map)
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
        ("<return>" . select-state)
	("M-u" . uppercase-state))

  (:map select-map
	("<return>" . edit-state))

  (:map replace-map
        ("<return>" . edit-state))

  (:map uppercase-map
	("<return>" . edit-state)
	("M-i" . insert-state)))


(use-package which-key
  :config
  (setq which-key-idle-delay 0.5
	which-key-idle-secondary-delay 0
	which-key-sort-order 'which-key-prefix-then-key-order)
  (which-key-mode 1))


(provide 'core-keybindings)
