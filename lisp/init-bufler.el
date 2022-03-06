(use-package bufler
  :disabled t
  :config (lmap
	    "TAB" 'bufler
	    "b b" 'bufler)
  (global-set-key (kbd "C-c l") 'bufler)
  (define-key bufler-list-mode-map (kbd "q") 'kill-buffer-and-window))


(provide 'init-bufler)
