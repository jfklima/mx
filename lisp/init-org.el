(use-package org
  :ensure nil
  :config
  (setq org-directory "~/org/")

  (setq org-capture-templates
	   '(("a" "Add TODO in PROJECT" entry (file+headline "~/org/todo.org" "Tarefas")
	      "* TODO %?%i%A")))

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


  (lmap
    "o" '(:def nil :wk "org")
    "o c" 'org-capture
    "o a" 'org-agenda
    "o t" 'org-store-link
    "o o" 'todo
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
    "w" '(lambda ()
	   (interactive)
	   (if (equal (buffer-name) "CAPTURE-todo.org")
	       (org-capture-refile)
	     (org-refile)))
    "i" 'org-set-tags-command
    "l" 'org-insert-link
    "o" 'org-open-at-point))


(defun todo ()
  (interactive)
  (find-file "~/org/todo.org"))

(todo)

(provide 'init-org)
