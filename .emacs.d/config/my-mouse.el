(defun shell-region (start end)
  "Execute region in an inferior shell"
  (interactive "r")
  (shell-command  (buffer-substring-no-properties start end)))

(defun shell-region-to-buffer (start end)
  "Execute region and send results to buffer"
  (interactive "r")
  (insert (shell-command-to-string (buffer-substring-no-properties start end))))

(defun shell-region-to-kill-ring (start end)
  "Execute region and send results to buffer"
  (interactive "r")
  (kill-new (shell-command-to-string (buffer-substring-no-properties start end))))
