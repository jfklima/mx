(use-package company
  :demand t

  :init
  (imap "TAB" 'company-complete)

  :config
  (setq completion-ignore-case t
	company-tooltip-align-annotations t
	company-minimum-prefix-length 3
	company-idle-delay 0.0)

  (let ((map company-active-map))

    (define-key map (kbd "M-j") 'company-abort)
    (define-key map (kbd "C-j") 'company-abort)

    (define-key map (kbd "M-l") 'company-complete-common-or-cycle)
    (define-key map (kbd "C-l") 'company-complete-common-or-cycle)

    (define-key map (kbd "M-k") 'backward-kill-word)
    (define-key map (kbd "C-k") 'backward-kill-word))

  (global-company-mode +1))


(use-package avy
  :config
  (setq avy-background t)
  (emap
    "j" 'avy-goto-char))


(use-package crux)
  ;; :bind
  ;; (:map edit-map
	;; ("a" . crux-move-beginning-of-line)

	;; ("m" . newline)
	;; ("C-m" . crux-smart-open-line)
	;; ("sm" . crux-smart-open-line-above)
	;; ("k" . crux-smart-kill-line)))


(use-package zzz-to-char
  :config
  (emap "z" 'zzz-to-char))


(use-package expand-region
  :config
  (emap
    "=" 'er/expand-region
    "C-=" 'er/contract-region))


(use-package undo-fu
  :config
  (emap
    "/" 'undo-fu-only-undo
    "C-/" 'undo-fu-only-redo))


;; PACOTES NÃO UTILIZADOS
(use-package selected
  :disabled t
  :commands selected-minor-mode
  :bind (:map selected-keymap
	      ("q" . selected-off)
	      ("u" . upcase-region)
	      ("d" . downcase-region)
	      ("w" . count-words-region)
	      ("m" . apply-macro-to-region-lines)))


(use-package ialign
  :disabled t
  :config
  (vmap
    "C-j" #'ialign
    "M-j" #'ialign))


(use-package pcre2el)



(provide 'edit)
