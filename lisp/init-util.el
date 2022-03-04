(use-package avy
  :config
  (setq avy-background t)
  (emap
    "j" 'avy-goto-char))


(use-package crux)
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


(use-package undo-fu
  :config
  (emap
    "/" 'undo-fu-only-undo
    "C-/" 'undo-fu-only-redo))


(provide 'init-util)
