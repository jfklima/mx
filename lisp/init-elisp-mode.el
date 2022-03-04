(use-package elisp-mode
  :ensure nil
  :config
  (mmap :keymaps 'emacs-lisp-mode-map
    "f" 'eval-defun
    "x" 'eval-last-sexp
    "i" 'helm-imenu)
  (mmap :keymaps 'lisp-interaction-mode-map
    "x" 'eval-last-sexp
    "f" 'eval-defun))


(provide 'init-elisp-mode)
