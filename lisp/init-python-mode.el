(use-package python
  :ensure nil
  :hook
  (python-mode . electric-pair-local-mode))

(mmap :keymaps 'python-mode-map)


(provide 'init-python-mode)
