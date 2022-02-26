(use-package company
  :demand t

  :init
  (add-hook 'after-init-hook 'company-tng-mode)
  (imap "TAB" 'company-complete)

  :config
  (setq completion-ignore-case t
	company-tooltip-align-annotations t
	company-minimum-prefix-length 3
	;; company-require-match nil
	;; company-require-match 'company-explicit-action-p
	company-idle-delay 0.0)

  (let ((map company-active-map))

    (define-key map (kbd "M-l") 'company-select-previous)
    (define-key map (kbd "C-l") 'company-select-previous)

    (define-key map (kbd "M-k") 'company-abort)
    (define-key map (kbd "C-k") 'company-abort))

    (global-company-mode +1))



(use-package avy
  :config
  (setq avy-background t)
  (emap
    "j" 'avy-goto-char))


(use-package crux)
;; COMMANDS
(emap
  "a" 'crux-move-beginning-of-line
  "C-m" 'crux-smart-open-line
  "sm" 'crux-smart-open-line-above
  "sk" 'crux-kill-line-backwards
  "C-k" 'crux-smart-kill-line
  "sl" 'crux-duplicate-current-line-or-region
  "sj" 'crux-top-join-line
  "M-o" 'crux-other-window-or-switch-buffer)


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
