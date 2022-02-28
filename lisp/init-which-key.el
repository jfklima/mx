(use-package which-key
  :after general
  :config
  (setq which-key-idle-delay 0.7
	which-key-idle-secondary-delay 0
	which-key-sort-order 'which-key-prefix-then-key-order
	which-key-show-prefix 'left)
  (which-key-mode 1))


(provide 'init-which-key)
