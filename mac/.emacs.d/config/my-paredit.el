(progn
  (require 'paredit)
  (require 'evil-paredit)

  (add-hook 'paredit-mode-hook 'evil-paredit-mode)

  (define-key evil-normal-state-map (kbd "C-l") 'paredit-forward-slurp-sexp)
  (define-key evil-normal-state-map (kbd "C-h") 'paredit-forward-barf-sexp))

(provide 'my-paredit)
