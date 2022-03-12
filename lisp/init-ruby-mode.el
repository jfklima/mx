(add-hook 'ruby-mode-hook 'electric-pair-local-mode)

(add-hook 'ruby-mode-hook '(lambda () (lsp)))

(require 'init-rails-mode)

(provide 'init-ruby-mode)
