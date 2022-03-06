(defun visit-init ()
  "Visita o arquivo init do usuário."
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

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
  (if (file-regular-p (buffer-file-name (other-buffer)))
      (switch-to-buffer (other-buffer))
    (message "Other buffer not FILE REGULAR.")))


(defun smart-last-buffer ()
  (interactive)
  ;; captura o other-buffer
  ;; veriifica se
  ;;; visita um arquivo ou tem extension or
  ;;; o buffer-name e *scratch*

  (let ((name (buffer-name (other-buffer))))
    (if (or (file-name-extension name)
	    (equal name "*scratch*"))
	(switch-to-buffer name)
      (helm-buffers-list))))


(provide 'funcs)
