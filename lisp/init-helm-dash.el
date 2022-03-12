(use-package helm-dash
  :config
  (mmap
    "h" 'helm-dash
    "." 'helm-dash-at-point))

(defun python-doc ()
  (interactive)
  (setq-local dash-docs-docsets '("Python 3")))
(add-hook 'python-mode-hook 'python-doc)

(defun emacs-lisp-doc ()
  (interactive)
  (setq-local dash-docs-docsets '("Emacs Lisp")))
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-doc)

(defun ruby-doc ()
  (interactive)
  (setq-local dash-docs-docsets '("Ruby" "Ruby on Rails" )))
(add-hook 'ruby-mode-hook 'ruby-doc)

(provide 'init-helm-dash)
