(use-package telephone-line
  :init
  (display-time-mode t)

  :config

  (telephone-line-defsegment* telephone-line-mx-buffer-segment ()
    (buffer-name))

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
	  ((multistate-mark-state-p)
	   'telephone-line-evil-visual)
	  ((multistate-replace-state-p)
	   'telephone-line-evil-replace)
	  ((multistate-uppercase-state-p)
	   'telephone-line-evil-motion)
	  (t 'telephone-line-evil-normal)))


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
    (mx-buffer . telephone-line-mx-buffer-face)
    (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
    (nil . (mode-line . mode-line-inactive))))

  (setq telephone-line-lhs
	'((modal . (telephone-line-multistate-tag-segment))
	  (mx-buffer . (telephone-line-mx-buffer-segment))
	  (nil . (telephone-line-position-segment)))

	telephone-line-center-lhs
	'((accent . (telephone-line-major-mode-segment)))

	telephone-line-center-rhs
	'((mx-blue . (telephone-line-perspective-segment))
	  (nil . (telephone-line-mx-display-time-segment)))

	telephone-line-rhs
	'((accent . (telephone-line-projectile-segment))
	  (mx-red . (telephone-line-vc-segment))
	  (accent . (telephone-line-flycheck-segment))))


  (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
	telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
	telephone-line-primary-right-separator 'telephone-line-cubed-right
	telephone-line-secondary-right-separator 'telephone-line-cubed-right)

  (setq telephone-line-height 24)

  (telephone-line-mode 1))


(provide 'init-telephone-line)
