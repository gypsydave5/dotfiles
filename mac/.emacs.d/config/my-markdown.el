(progn
  (defun markdown-setup ()
    (nlinum-mode -1))
  (add-hook 'markdown-mode-hook 'auto-fill-mode)
  (add-hook 'markdown-mode-hook 'markdown-setup))
(provide 'my-markdown)
