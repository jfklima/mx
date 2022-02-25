(defun insert-space ()
  "Insert space in point."
  (interactive)
  (progn
    (insert-state)
    (insert " ")
    (edit-state)
    (backward-char)))


(defun insert-space-insert ()
  "Insert space in point and active insert-state."
  (interactive)
  (progn
    (insert-state)
    (insert " ")
    (edit-state)
    (backward-char)
    (insert-state)))


(defun insert-space-between-chars ()
  "Insert space between chars and active insert-state."
  (interactive)
  (progn
    (insert " ")
    (backward-char)
    (insert " ")
    (insert-state)))


(defun last-buffer ()
  (interactive)
  (if (Buffer-menu--pretty-file-name
  (switch-to-buffer (other-buffer)))


(provide 'funcs)
