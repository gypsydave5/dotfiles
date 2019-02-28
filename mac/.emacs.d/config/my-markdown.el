(progn
  (defun markdown-setup ()
    (nlinum-mode -1))
  (setq markdown-command "pandoc")
  (setq word-wrap t)
  (add-hook 'markdown-mode-hook 'auto-fill-mode)
  (add-hook 'markdown-mode-hook 'markdown-setup))
(provide 'my-markdown)
