;; AJUSTES


;; coloca o arquivo de configurações automáticas em um lugar adequado
(setq custom-file (make-temp-file "emacs-custom"))


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


;; habilita comando para limpar um buffer.
(put 'erase-buffer 'disabled nil)


;; inicializa o emacs em tela cheira
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))


;; habilita a visualização da númeração das linha nos buffers de programação
(add-hook 'prog-mode-hook 'line-number-mode)


(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;; instala o melhor gerenciador de pacotes do mundo Emacs
(let ((package 'use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))
(setq use-package-always-ensure t)

;; define o local onde ficarão os meus arq de configuração
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; APARÊNCIA
(require 'ui)
;; INTERFACE
(require 'core-keybindings)
(require 'interactive)
;; EDIT
(require 'edit)
;; ORG-MODE
(require 'organize)
;; PROGRAMMING
(require 'programming)
(require 'funcs)
;; KEYBINDINGS
(require 'keybindings)
;; MANAGER-PROJETOS
(require 'manager-projects)
