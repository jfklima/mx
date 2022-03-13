(use-package telephone-line
  :defer 0.1
  :init
  (display-time-mode t)

  :config
  (defface telephone-line-mx-buffer-no-modified
    '((t (:foreground "green" :background "Gray23" :bold t)))
    "Face para o quando o buffer ainda não foi modificado."
    :group 'telephone-line-mode)

  (defface telephone-line-mx-buffer-modified
    '((t (:foreground "red" :background "Gray1" :bold nil)))
    "Face para indicar quando o buffer for modificado."
    :group 'telephone-line-mode)

    (defface telephone-line-mx-buffer-read-only
    '((t (:foreground "blue" :background "Gray23" :bold t)))
    "Face para indicar quando o buffer for modificado."
    :group 'telephone-line-mode)

  (defun telephone-line-mx-buffer-face (active)
    (cond ((not active) 'mode-line-inactive)
	  ((buffer-modified-p) 'telephone-line-mx-buffer-modified)
	  (buffer-read-only 'telephone-line-mx-buffer-read-only)
	  (t 'telephone-line-mx-buffer-no-modified)))


  (defun telephone-line-mx-blue-face (active)
    (if (not active)
	'mode-line-inactive
      'telephone-line-evil-motion))

    (defun telephone-line-mx-red-face (active)
    (if (not active)
	'mode-line-inactive
      'telephone-line-evil-normal))

    (defun telephone-line-mx-black-face (active)
	  (if (not active)
	'mode-line-inactive
      'telephone-line-evil-replace))

    (telephone-line-defsegment* telephone-line-mx-buffer-segment ()
      (if (projectile-project-root)
	  (if (buffer-file-name (current-buffer))
	      (nth 1 (split-string (buffer-file-name) (projectile-project-name)))
	    (buffer-name))
	(buffer-name)))

    (defun telephone-line-modal-face (active)
      "Return an appropriate face for the current mode, given whether the frame is ACTIVE."
      (cond ((not active) 'mode-line-inactive)
	    ((not multistate-mode)
	     'telephone-line-evil-emacs)
	    ((multistate-insert-state-p)
	     'telephone-line-evil-insert)
	    ((multistate-mark-state-p)
	     'telephone-line-evil-visual)
	    ((multistate-replace-state-p)
	     'telephone-line-evil-replace)
	    ((multistate-uppercase-state-p)
	     'telephone-line-evil-motion)
	    (t 'telephone-line-evil-normal)))

    (setq telephone-line-faces
	  '((modal . telephone-line-modal-face)
	    (persp . telephone-line-persp-face)
	    (mx-blue . telephone-line-mx-blue-face)
	    (mx-red . telephone-line-mx-red-face)
	    (mx-black . telephone-line-mx-black-face)
	    (mx-buffer . telephone-line-mx-buffer-face)
	    (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
	    (nil . (mode-line . mode-line-inactive))))


  (telephone-line-defsegment* telephone-line-position-segment ()
    (telephone-line-raw
     (if (eq major-mode 'paradox-menu-mode)
	 ;;Paradox fills this with position info.
	 mode-line-front-space
	 mode-line-percent-position) t))


  (telephone-line-defsegment* telephone-line-multistate-tag-segment ()
    "Displays current multistate state."
    ;; (when (bound-and-true-p multistate-mode)
      (let ((tag (if (bound-and-true-p multistate-mode)
		     (cond
		      ((when (multistate-insert-state-p) "INSERT"))
		      ((when (multistate-mark-state-p) "MARK"))
		      ((when (multistate-replace-state-p) "REPLACE"))
		      ((when (multistate-uppercase-state-p) "CAPS-LOOK"))
		      (t "EDIT"))
		   "DISABLED")))
	tag))


  (telephone-line-defsegment* telephone-line-mx-display-time-segment ()
    "Display current time."
    (when (display-time-mode)
      (setq display-time-24hr-format t)
      (shell-command-to-string "echo -n $(date '+%H:%M%p')")))

  (telephone-line-defsegment telephone-line-flycheck-segment ()
  "Displays current checker state."
  (when (bound-and-true-p flycheck-mode)
    (let* ((text (pcase flycheck-last-status-change
		   ('finished (if flycheck-current-errors
				  (let-alist (flycheck-count-errors flycheck-current-errors)
				    (if (or .error .warning)
					(propertize (format "%s/%s"
							    (or .error 0) (or .warning 0))
						    'face 'telephone-line-warning)
				      ""))
				(propertize ":)" 'face 'telephone-line-unimportant)))
		   ('running     "*")
		   ('no-checker  (propertize "-" 'face 'telephone-line-unimportant))
		   ('not-checked "=")
		   ('errored     (propertize "!" 'face 'telephone-line-error))
		   ('interrupted (propertize "." 'face 'telephone-line-error))
		   ('suspicious  "?"))))
      (propertize text
		  'help-echo (pcase flycheck-last-status-change
			       ('finished "Display errors found by Flycheck")
			       ('running "Running...")
			       ('no-checker "No Checker")
			       ('not-checked "Not Checked")
			       ('errored "Error!")
			       ('interrupted "Interrupted")
			       ('suspicious "Suspicious?"))
		  'display '(raise 0.0)
		  'mouse-face '(:box 1)
		  'local-map (make-mode-line-mouse-map
			      'mouse-1 #'flycheck-list-errors)))))

(telephone-line-defsegment* telephone-line-xah-fly-keys-segment ()
  (when (boundp xah-fly-insert-state-q)
    (let ((tag (if xah-fly-insert-state-q
		   "INSERT" "COMMAND")))
      (if telephone-line-evil-use-short-tag
	  (seq-take tag 1)
	tag))))


  (setq telephone-line-lhs
	'(
	  (modal . (telephone-line-multistate-tag-segment))
	  (nil . (telephone-line-mx-display-time-segment))
	  (mx-blue . (telephone-line-projectile-segment))
	  )

	telephone-line-center-lhs
	'(
	  (mx-buffer . (telephone-line-mx-buffer-segment))
	  (nil . (telephone-line-position-segment))
	  )

	telephone-line-center-rhs
	'(
	  (accent . (telephone-line-major-mode-segment))
	  )

	telephone-line-rhs
	'(
	  ;; (accent . (telephone-line-process-segment))
	  (mx-red . (telephone-line-vc-segment))
	  ;; (accent . (telephone-line-atom-encoding-segment))
	  (accent . (telephone-line-flycheck-segment))
	  ))


  (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
	telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
	telephone-line-primary-right-separator 'telephone-line-cubed-right
	telephone-line-secondary-right-separator 'telephone-line-cubed-right)
  (setq telephone-line-height 42)


  (telephone-line-mode 1))


(provide 'init-telephone-line)
