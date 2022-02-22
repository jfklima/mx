(use-package telephone-line
  :config

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
		      ((when (multistate-select-state-p) "MARK"))
		      ((when (multistate-replace-state-p) "REPLACE"))
		      ((when (multistate-uppercase-state-p) "CAPS-LOOK"))
		      (t "EDIT"))
		   "DISABLED")))
	tag))


  (telephone-line-defsegment* telephone-line-perspective-segment ()
    (when (bound-and-true-p persp-mode)
      (telephone-line-raw (persp-current-name) t)))

  (defface telephone-line-persp
  '((t (:background "#A0522d" :inherit mode-line)))
  "Hightlight face for the perspective segment"
  :group 'telephone-line)

  (defun telephone-line-persp-face (active)
    "Return an appropriate face for show persp-current-name"
    (when (bound-and-true-p persp-mode)
      'telephone-line-persp))


  (defun telephone-line-modal-face (active)
    "Return an appropriate face for the current mode, given whether the frame is ACTIVE."
    (cond ((not active) 'mode-line-inactive)
	  ((not multistate-mode)
	   'telephone-line-evil-emacs)
	  ((multistate-insert-state-p)
	   'telephone-line-evil-insert)
	  ((multistate-select-state-p)
	   'telephone-line-evil-visual)
	  ((multistate-replace-state-p)
	   'telephone-line-evil-replace)
	  ((multistate-uppercase-state-p)
	   'telephone-line-evil-motion)
	  (t 'telephone-line-evil-normal)))

  (telephone-line-defsegment* telephone-line-magit-segment ()
    (telephone-line-raw (magit-name-branch)))


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

  (setq telephone-line-faces
  '((modal . telephone-line-modal-face)
    (persp . telephone-line-persp-face)
    (mx-blue . telephone-line-mx-blue-face)
    (mx-red . telephone-line-mx-red-face)
    (mx-black . telephone-line-mx-black-face)
    (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
    (nil . (mode-line . mode-line-inactive))))

  (setq telephone-line-lhs
	'((modal . (telephone-line-multistate-tag-segment))
	  (nil . (telephone-line-buffer-segment))
	  (nil . (telephone-line-position-segment)))

	telephone-line-center-lhs
	'((nil . (telephone-line-major-mode-segment)))

	telephone-line-center-rhs
	'((mx-blue . (telephone-line-perspective-segment))
	  (accent . (telephone-line-atom-encoding-segment)))

	telephone-line-rhs
	'((mx-black . (telephone-line-projectile-segment))
	  (mx-red . (telephone-line-vc-segment))))


  (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
	telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
	telephone-line-primary-right-separator 'telephone-line-cubed-right
	telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)

  (setq telephone-line-height 24)

  (telephone-line-mode 1))


(provide 'init-telephone-line)
