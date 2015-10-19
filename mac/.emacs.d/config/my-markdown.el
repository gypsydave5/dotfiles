(progn
  (add-hook 'markdown-mode-hook 'auto-fill-mode)
  (add-hook 'markdown-mode-hook 'flyspell-mode))

(provide 'my-markdown)
