(use-package monokai-theme
  :config (load-theme 'monokai t))


(use-package all-the-icons
  :if (display-graphic-p))


(use-package beacon
  :config
  (beacon-mode 1)
  (setq beacon-color "#Ffff00"))


(provide 'ui)
