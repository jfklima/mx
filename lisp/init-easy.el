;; inibi a tela de inicialização
(setq inhibit-startup-screen t)


;; desliga a barra de ferramentas em todos os quadro
(tool-bar-mode -1)


;; desliga a barra de menus em todos os guadros
(menu-bar-mode -1)


;; desliga a barra de rolagem em todos os guadros
(scroll-bar-mode -1)


;; Desliga o piscar do cursor
(blink-cursor-mode -1)


;; liga a visualização de parentes correspondentes
(show-paren-mode 1)


;; habilita o destaque da linha atual
(remove-hook 'prog-mode-hook 'hl-line-mode)


;; Habilita a exibição de numeros de linha nos buffers de programação.
(add-hook 'prog-mode-hook 'display-line-numbers-mode)


;; desliga os alertas sonoros e visuais completamente
(setq ring-bell-function 'ignore)


;; define um local para centralizar os meus backaps
(setq backup-directory-alist `(("." . "~/.saves")))


;; limpa os espaçõs desnecessãrios quando salva o arquivo.
(add-hook 'before-save-hook #'whitespace-cleanup)


;; habilita comando para limpar um buffer.
(put 'erase-buffer 'disabled nil)


;; inicializa o emacs em tela cheira
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))


;; habilita a visualização da númeração das linha nos buffers de programação
(add-hook 'prog-mode-hook 'line-number-mode)


;; force emacs init text-mode
(setq-default major-mode 'text-mode)


;; salva a sessão de trabalho.
(desktop-save-mode 1)

;; Performance
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(provide 'init-easy)
