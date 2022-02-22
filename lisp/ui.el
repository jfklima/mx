
;; carrega o melhor thema de cor do UNIVERSO
(use-package monokai-theme
  :config (load-theme 'monokai t))


(use-package all-the-icons
  :if (display-graphic-p))

;; Usa uma linha de modo minimalista e fácil de configurar.
(require 'init-telephone-line)


(use-package beacon
  :config
  (beacon-mode 1)  
  (setq beacon-color "#Ffff00"))


(provide 'ui)
