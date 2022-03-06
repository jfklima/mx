(use-package undo-fu
  :config
  (emap
    "/" 'undo-fu-only-undo
    "C-/" 'undo-fu-only-redo))


(provide 'init-undo-fu)
