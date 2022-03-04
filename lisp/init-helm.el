(use-package helm
  :disabled t
  :demand t
  :config
  (require 'helm-config)

  (setq helm-move-to-line-cycle-in-source nil)

  (define-key helm-map (kbd "<tab>") 'helm-next-line)
  (define-key helm-map (kbd "C-j") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i")  'helm-select-action)

  (setq helm-autoresize-max-height 60)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)

  (lmap
    "SPC" 'helm-M-x
    "s s" 'helm-occur)

  (helm-mode 1))



(provide 'init-helm)
