(require 'move-text)

(emap
  ;; MOVIMENTAÇÃO
  "n" 'next-line
  "p" 'previous-line
  "a" 'beginning-of-line
  "e" 'end-of-line
  "f" 'forward-char
  "b" 'backward-char

  "l" 'recenter-top-bottom
  "v" 'scroll-up-command
  "V" 'scroll-down-command
  "]" 'scroll-other-window
  "[" 'scroll-other-window-down

  ;; EDIÇÃO
  "w" 'kill-region
  "c" 'kill-ring-save
  "t" 'move-text-up
  "h" 'move-text-down
  ";" 'comment-line
  "g" 'keyboard-quit

  "m" 'newline
  "o" 'open-line
  "k" 'kill-line
  "d" 'delete-char

  "x" 'backward-delete-char-untabify
  "\\" 'delete-horizontal-space

  "s" nil
  "Q" 'fill-paragraph
  "K" 'kill-whole-line
  "D" 'kill-word
  "J" 'join-line
  "X" 'backward-kill-word
  "F" 'forward-word
  "B" 'backward-word
  "A" 'backward-sentence
  "E" 'forward-sentence
  ;; insert
  "Is" 'insert-space
  "Ii" 'insert-space-insert
  "Ib" 'insert-space-between-chars

  "y" 'yank
  "Y" 'yank-pop

  "/" 'undo

  "ç" 'exchange-point-and-mark
  "C" "C-c C-c"

  "r" '(:def nil :wk "register")
  "r r" 'point-to-register
  "r j" 'jump-to-register

  ":" 'eval-expression

  "q" 'kill-buffer-and-window)
  ;; "q" 'quit-window)


;; leader-map
(lmap
  "SPC" 'execute-extended-command
  "TAB" 'last-buffer
  "h" '(:def nil :wk "help")
  "h" help-map
  "f" '(:def nil :wk "file")
  "f f" 'find-file
  "f i" '(:def (lambda () (interactive) (ido-find-file-in-dir "~/.emacs.d/lisp/"))
	       :wk "find-inits")

  "f o" 'find-file-other-window

  "b" '(:def nil :wk "buffer")
  "b s" 'save-buffer
  "b b" 'switch-to-buffer
  "b k" 'kill-this-buffer
  "b a" 'beginning-of-buffer
  "b e" 'end-of-buffer
  "b o" 'switch-to-buffer-other-window
  "b K" '(:def crux-kill-other-buffers :wk "kill-other-buffers")
  "b D" '(:def crux-delete-buffer-and-file :wk "delete-buffer-and-file")
  "b R" '(:def crux-rename-buffer-and-file :wk "rename-buffer-and-file")

  "w" '(:def nil :wk "window")
  "w -" 'split-window-below
  "w |" 'split-window-horizontally
  "w u" 'delete-other-windows
  "w d" 'delete-window
  "w k" 'kill-buffer-and-window
  "w o" 'other-window

  "m" '(:def nil :wk "mode")

  "s" '(:def nil :wk "search")

  "B" '(:def nil :wk "bookmarks")
  "B a" '(:def bookmark-set :wk "add-to-bookmak")
  "B l" 'bookmark-jump
  "B m" '(:def list-bookmarks :wk "manager-bookmarks")

  "a" '(:def nil :wk "applications")
  "a s" 'eshell

  "t" '(:def nil :wk "toggle")
  "t c" '(:def company-mode :wk "autocomplete")

  "q" '(:def nil :wk "quit")
  "q q" 'save-buffers-kill-emacs)


(imap
  "SPC" 'self-insert-command
  "C-l" 'backward-kill-word)

(umap
  "SPC" 'self-insert-command)

(rmap
  "SPC" 'self-insert-command)


(provide 'init-keybindings)
