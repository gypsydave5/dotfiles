(use-package helm
  :ensure t
  :demand
  :preface (require 'helm-config)
  :bind (("M-x" . helm-M-x)
         ("C-x p" . help-mini))
  :config
  (helm-mode 0)
  (helm-autoresize-mode 1)
  (setq
   helm-buffers-fuzzy-matching t
   helm-recentf-fuzzy-match t))

(provide 'my-helm)
