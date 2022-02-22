(emap
  "n" 'next-line
  "p" 'previous-line
  "a" 'beginning-of-line
  "e" 'end-of-line
  "f" 'forward-char
  "b" 'backward-char
  "F" 'forward-word
  "B" 'backward-word
  "A" 'backward-sentence
  "E" 'forward-sentence
  "sa" 'backward-sentence
  "se" 'forward-sentence

  "l" 'recenter-top-bottom
  "v" 'scroll-up-command
  "V" 'scroll-down-command
  "]" 'scroll-other-window
  "[" 'scroll-other-window-down
  "G" 'goto-line

  "m" 'newline
  "o" 'open-line
  "k" 'kill-line
  "K" 'kill-whole-line
  "J" 'join-line
  "J" 'join-line
  ";" 'comment-line
  "Q" 'fill-paragraph

  "s s" 'insert-space
  "s i" 'insert-space-insert
  "s l" 'insert-space-between-chars

  "d" 'delete-char
  "D" 'kill-word
  "x" 'backward-delete-char-untabify
  "X" 'backward-kill-word
  "\\" 'delete-horizontal-space

  "w" 'kill-region
  "W" 'kill-ring-save
  "y" 'yank
  "Y" 'yank-pop

  "g" 'keyboard-quit
  "/" 'undo

  "C" "C-c C-c"
  "ç" "C-x C-x"

  "r" '(:def nil :wk "register")
  "r r" 'point-to-register
  "r j" 'jump-to-register

  "h" 'info

  ":" 'eval-expression

  "q" 'quit-window)


;; leader-map
(lmap
  "SPC" '(:def helm-M-x :wk "M-x")
  "TAB" 'last-buffer
  "h" '(:def nil :wk "help")
  "h" help-map
  "f" '(:def nil :wk "file")
  "f f" '(:def helm-find-files :wk "find-file")
  "f i" 'config-emacs
  "f o" 'find-file-other-window

  "b" '(:def nil :wk "buffer")
  ;; "b s" 'delete-trailing-whitespace
  "b s" 'save-buffer
  "b b" 'helm-buffers-list
  "b k" 'kill-this-buffer
  "b a" 'beginning-of-buffer
  "b e" 'end-of-buffer
  "b o" 'switch-to-buffer-other-window
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
  "s s" '(:def helm-occur :wk "helm-search")

  "B" '(:def nil :wk "bookmarks")
  "B a" '(:def bookmark-set :wk "add-to-bookmak")
  "B l" 'bookmark-jump
  "B m" '(:def list-bookmarks :wk "manager-bookmarks")

  "a" '(:def nil :wk "applications")
  "a s" 'eshell

  "q" '(:def nil :wk "quit")
  "q q" 'save-buffers-kill-emacs
  )


(imap
  "SPC" 'self-insert-command
  "C-l" 'backward-kill-word)

(umap
  "SPC" 'self-insert-command)


(rmap
  "SPC" 'self-insert-command)


(provide 'keybindings)
