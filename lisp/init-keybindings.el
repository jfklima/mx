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
  "[" 'scroll-other-window
  "]" 'scroll-other-window-down

  ;; EDIÇÃO
  "w" 'kill-region
  "c" 'kill-ring-save
  "t" 'move-text-up
  "T" 'move-text-down
  ";" 'comment-line
  "g" 'keyboard-quit

  "m" 'newline
  "o" 'open-line
  "k" 'kill-line
  "d" 'delete-char

  "x" 'backward-delete-char-untabify
  "\\" 'delete-horizontal-space

  "s" nil
  ",q" 'fill-paragraph
  ",k" 'kill-whole-line
  ",d" 'kill-word
  ",j" 'join-line
  ",x" 'backward-kill-word
  ",f" 'forward-word
  ",b" 'backward-word
  ",a" 'backward-sentence
  ",e" 'forward-sentence

  ;; INSERT
  "ss" 'insert-space
  "si" 'insert-space-insert
  "sb" 'insert-space-between-chars

  "y" 'yank
  ",y" 'yank-pop

  "/" 'undo

  "ç" 'exchange-point-and-mark
  ",c" "C-c C-c"

  "r" '(:def nil :wk "register")
  "r r" 'point-to-register
  "r j" 'jump-to-register

  "<" 'kmacro-start-macro
  ">" 'kmacro-end-macro
  "." 'kmacro-end-and-call-macro

  ":" 'eval-expression

  "h" 'info

  "q" 'quit-window)

;; leader-map
(lmap
  "SPC" 'execute-extended-command
  "TAB" 'last-buffer
  "h" '(:def nil :wk "help")
  "h" help-map
  "f" '(:def nil :wk "file")
  "f f" 'find-file
  "f I" 'visit-init
  "f o" 'find-file-other-window
  "f w" '(:def write-file :wk "save-as")

  "b" '(:def nil :wk "buffer")
  "b s" 'save-buffer
  "b b" 'switch-to-buffer
  "b i" 'ibuffer
  "b k" 'kill-this-buffer
  "b a" 'beginning-of-buffer
  "b e" 'end-of-buffer
  "b o" 'switch-to-buffer-other-window
  "b K" '(:def crux-kill-other-buffers :wk "kill-other-buffers")
  "b D" '(:def crux-delete-buffer-and-file :wk "delete-buffer-and-file")
  "b R" '(:def crux-rename-buffer-and-file :wk "rename-buffer-and-file")
  "b q" '(:def (lambda ()
		 "Open scratch buffer in other window."
		 (interactive)
		 (switch-to-buffer "*scratch*"))
	       :wk "*scratch*")

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
  "C-l" 'recenter-top-bottom
  "M-l" 'backward-kill-word)

(umap
  "SPC" 'self-insert-command)

(rmap
  "SPC" 'self-insert-command)


(provide 'init-keybindings)
