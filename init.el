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


;; torna o `text-mode' o modo major default.
(setq-default major-mode 'text-mode)


;; deaabilita colocar o emacs em segundo plano.
(global-set-key (kbd "C-z") nil)


;; (setq custom-file (make-temp-file "emacs-custom"))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "community" user-emacs-directory))


;; configura o gerenciamento de pacotes.
(require 'config-packages)


;; concentra todos os arquivo de init de pacontes.
(require 'config)


;; inicia as minha configurações do pacote org-mode
;; é o meu principal paconte para uso no emacs.
(require 'init-org-mode)


;; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(when (file-exists-p custom-file)
  (load custom-file))


;; inicia o meu sistema de organização do trabalho.
(find-file (expand-file-name "organizador.org" org-directory))
