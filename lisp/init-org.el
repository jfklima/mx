(use-package org
  :ensure nil
  :config
  (require 'org)
  (setq org-clock-sound "~/.songs/ding.wav")

  (setq org-directory "~/org/")

  (setq org-capture-templates
	   '(("a" "ADD TODO" entry (file+headline "~/org/todo.org" "Tarefas")
	      "* TODO %?%i%A")
	     ("n" "NOTA" entry (file+headline "~/org/nota.org" "Anotation")
	      "* %?")))

  (setq org-hide-leading-stars t)

    (setq org-todo-keywords
	  '((sequence "PROJECT(p)" "TODO(t)" "|" "DONE(d)")))

  (setq org-todo-keyword-faces
	'(("PROJECT" . (:foreground "blue"))))

  (defun init-org-mode ()
    (progn
      (org-shifttab)
      (auto-fill-mode)))

  (add-hook 'org-mode-hook 'init-org-mode)

  (setq org-agenda-files '("~/org/todo.org" "~/org/compromissos.org"))

  ;; comando para trabalhar com project.org. Cada projeto terá um
  ;; arquivo de org para permitir o gerenciamento de projetos.  O
  ;; comando permitirá acessar o arquivo project.org do projeto se
  ;; este existir. Se não existir criará o arquivo na raiz do projeto.
  (require 'projectile)
  (defun switch-to-proj-org ()
    "Switch to file PROJ NAME-PROJECT ORG in project current."
    (interactive)
    (let ((file (concat (projectile-project-root)
			".PROJ-"
			(projectile-project-name)
			".org")))
      (if (file-exists-p file)
	  (find-file file)
	(progn
	  (make-empty-file file)
	  (find-file file)))))

  (lmap
    "o" '(:def nil :wk "org")
    "o c" 'org-capture
    "o a" 'org-agenda
    "o s" 'org-store-link
    "o t" '(:def nil :wk "timer")
    "o t t" 'org-timer-set-timer
    "o t p" 'org-timer-pause-or-continue
    ;; "o o" 'todo
    "o o" 'switch-to-proj-org
    "o f" 'explore-org-dir)

  (mmap
    :keymaps 'org-mode-map
    "t" 'org-todo
    "a" 'org-insert-todo-heading-respect-content
    "." 'org-time-stamp
    "s" 'org-schedule
    "d" 'org-deadline
    "/" 'org-sparse-tree
    "A" 'org-archive-subtree
    "w" '(:def (lambda ()
		 (interactive)
		 (if (or (equal (buffer-name) "CAPTURE-todo.org")
			 (equal (buffer-name) "CAPTURE-nota.org"))
		     (org-capture-refile)
		   (org-refile)))
	       :wk "refile")
    "i" 'org-set-tags-command
    "l" 'org-insert-link
    "o" 'org-open-at-point))


(defun todo ()
  (interactive)
  (find-file "~/org/todo.org"))

;; (todo)

(provide 'init-org)
