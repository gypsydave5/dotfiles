(progn
  (defun rename-file-and-buffer ()
    "Rename the current buffer and the associated file."
    (interactive)
    (let ((filename (buffer-file-name)))
      (if (not (and filename (file-exists-p filename)))
          (message "Buffer is not associated with a file")
        (let ((new-name (read-file-name "New name: " filename)))
          (cond
           ((vc-backend filename (vc-rename-file filename new-name))
            (t
             (rename-file filename new-name t)
             (set-visited-file-name new-name t t)))))))))
(provide 'my-emacs)
