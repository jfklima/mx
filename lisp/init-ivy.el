(use-package counsel
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")

  (define-key ivy-mode-map (kbd "RET") 'ivy-alt-done)
  (define-key ivy-mode-map (kbd "C-l") 'ivy-backward-kill-word)
  (define-key ivy-mode-map (kbd "M-l") 'ivy-backward-kill-word)
  (define-key ivy-mode-map (kbd "TAB") 'ivy-next-line)
  (define-key ivy-mode-map (kbd "M-<tab>") 'ivy-previous-line)

  (ivy-mode 1))

(provide 'init-ivy)
