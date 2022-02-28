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


(provide 'init-util)
