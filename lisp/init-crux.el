(use-package crux)
(emap
  "a" 'crux-move-beginning-of-line)

(emap
  "C-m" 'crux-smart-open-line
  "C-o" 'crux-smart-open-line-above
  "C-k" 'crux-smart-kill-line
  "C-n" 'crux-duplicate-current-line-or-region
  "J" 'join-line
  "C-j" 'crux-top-join-line)


(provide 'init-crux)
