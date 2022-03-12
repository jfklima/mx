(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2
	web-mode-css-indent-offset 2
	web-mode-code-indent-offset 2
	web-mode-attr-indent-offset 2)

  ;; preechimento esquerdo
  (setq web-mode-style-padding 1
	web-mode-script-padding 1
	web-mode-block-padding 0)

  ;; shortcuts
  (define-key web-mode-map (kbd "C-n") 'web-mode-tag-match)

  ;; snippets
  (setq web-mode-extra-snippets
	'(("erb" . (("toto" . "<% toto | %>\n\n<% end %>")))
	  ))

  ;; auto-pairs
  (setq web-mode-extra-auto-pairs
	'(("erb"  . (("beg" "end")))
	  ))
  (setq web-mode-enable-auto-pairing t)

  ;; Shortcuts
  (mmap :keymaps 'web-mode-map
    ;; General
    "i" 'web-mode-buffer-indent
    "s" 'web-mode-snippet-insert
    "f" 'web-mode-fold-or-unfold
    "m" 'web-mode-mark-and-expand
    "w" 'web-mode-whitespaces-show
    ;; HTML Element
    "e" '(:def nil :wk "element")
    "e c" 'web-mode-element-clone
    )
  )

(provide 'init-web-mode)
