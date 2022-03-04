(use-package avy
  :config
  (setq avy-background t)
  (emap
    "j" 'avy-goto-char))


(use-package crux)
(emap
  "a" 'crux-move-beginning-of-line)


(use-package zzz-to-char
  :config
  (emap "z" 'zzz-to-char))


(use-package undo-fu
  :config
  (emap
    "/" 'undo-fu-only-undo
    "C-/" 'undo-fu-only-redo))


(provide 'init-util)
