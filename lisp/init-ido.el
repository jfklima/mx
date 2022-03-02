(require 'ido)
(ido-mode 1)
;; (ido-everywhere 1)

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))

(use-package crm-custom
  :config
  (crm-custom-mode 1))

(setq ido-enable-flex-matching t
      ido-cannot-complete-command 'ido-next-match
      ido-max-window-height 0.8

      ido-file-extensions-order '(".py" ".org" ".el" ".sh")
      ido-ignore-buffers '("\\` " "^\\*\\.+\\*")
      ido-ignore-buffers (list (rx (or (and bos  " ")
				       (and bos
					    (or "*Completions*"
						"*Shell Command Output*"
						"*vc-diff*"
						"^*.+.*")
					    eos))))
      ido-ignore-extensions t

      ido-default-buffer-method 'select-window
      ido-default-file-method 'select-window)

(define-key ido-common-completion-map (kbd "SPC") 'ido-restrict-to-matches)
(define-key ido-common-completion-map (kbd "C-n") 'ido-next-match)
(define-key ido-common-completion-map (kbd "C-p") 'ido-prev-match)


(add-hook 'ido-make-file-list-hook
	  (lambda ()
	    (define-key ido-file-dir-completion-map (kbd "SPC") 'self-insert-command)
	    (define-key ido-file-dir-completion-map (kbd "C-l")
	      'ido-delete-backward-updir)))

(setq ido-decorations (quote ("\n-> "
			      ""
			      "\n "
			      "\n ..."
			      "[" "]"
			      " [No match]"
			      " [Matched]"
			      " [Not readable]"
			      " [Too big]"
			      " [Confirm]")))

(custom-set-faces
 ;; Face used by ido for highlighting subdirs in the alternatives.
 '(ido-subdir ((t (:foreground "#66ff00"))))
 ;; Face used by ido for highlighting first match.
 '(ido-first-match ((t (:foreground "#ccff66"))))
 ;; Face used by ido for highlighting only match.
 '(ido-only-match ((t (:background nil :foreground "#ffcc33")))))

(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

(require 'ido-hacks)
(ido-hacks-mode 1)

(require 'ido-occur)

(lmap
  "s s" 'ido-occur)

(provide 'init-ido)
