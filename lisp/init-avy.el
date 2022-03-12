(use-package avy
  :config
  (setq avy-background t)
  (emap
    "j" 'avy-goto-char)
  (lmap
    "j m l" 'avy-move-line
    "j k l" 'avy-kill-whole-line
    "j j l"  'avy-goto-line
    "j t" 'avy-goto-char-timer))

(provide 'init-avy)
