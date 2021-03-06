(progn
  (require 'helm-config)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x p") 'helm-mini)

  (helm-mode 0)
  (helm-autoresize-mode 1)
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t))

(provide 'my-helm)
