(use-package multistate
  :hook
  ;; enable multistate in prog and text modes
  (prog-mode . multistate-mode)
  (text-mode . multistate-mode)


  (multistate-change-state . multistate-change-cursor-color)

  ;; enable/disabled selection is Select state
  (multistate-mark-state-enter . (lambda () (set-mark (point))))
  (multistate-mark-state-exit .  deactivate-mark)

  ;; enable/disable overwrite-mode in Replace state
  (multistate-replace-state-enter . overwrite-mode)
  (multistate-replace-state-exit .  (lambda () (overwrite-mode 0)))

  ;; enable/disable caps-lock mode in uppercase state
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
  ;; Replace state
  (multistate-define-state
   'replace
   :lighter "REPLACING"
   :cursor 'hbar)

  ;; Select state
  (multistate-define-state
   'mark
   :lighter "MARKING"
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
  (defun mark-state () (interactive) (multistate-mark-state))
  (defun replace-state () (interactive) (multistate-replace-state))
  (defun uppercase-state () (interactive) (multistate-uppercase-state))

  (defvar edit-map 'multistate-edit-state-map)
  (defvar insert-map 'multistate-insert-state-map)
  (defvar mark-map 'multistate-mark-state-map)
  (defvar replace-map 'multistate-replace-state-map)
  (defvar uppercase-map 'multistate-uppercase-state-map)

    ;; define a cor do cursos para amarelo
  (when (multistate-mode)
    (custom-set-faces
     '(cursor ((t (:background "#Ffff00"
			       :foreground "#272822"
			       :inverse-video t))))))

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


  (global-set-key (kbd "M-m") 'multistate-mode))


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


(use-package which-key
  :config
  (setq which-key-idle-delay 0.7
	which-key-idle-secondary-delay 0
	which-key-sort-order 'which-key-prefix-then-key-order
	which-key-show-prefix 'left)
  (which-key-mode 1))


(provide 'core-keybindings)
