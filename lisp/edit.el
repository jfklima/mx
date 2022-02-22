(use-package company
  :config
  (setq completion-ignore-case t
	company-idle-delay 0.1
	company-tooltip-align-annotations t)
  (global-company-mode +1))


(use-package avy
  :config
  (setq avy-background t)
  (emap
    "j" 'avy-goto-char))


(use-package crux
  :config
  (emap
    "a" 'crux-move-beginning-of-line))


(use-package zzz-to-char
  :config
  (emap "z" 'zzz-to-char))


(use-package expand-region
  :config
  (emap "=" 'er/expand-region))


(use-package selected
  :commands selected-minor-mode
  :bind (:map selected-keymap
              ("q" . selected-off)
              ("u" . upcase-region)
              ("d" . downcase-region)
              ("w" . count-words-region)
              ("m" . apply-macro-to-region-lines)))


(use-package multifiles)


(use-package ialign
  :config
  (smap
    "TAB" #'ialign))


(use-package pcre2el)


(use-package undo-fu
  :config
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))



(provide 'edit)
