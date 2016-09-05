(progn
  (require 'org)
  (setq org-mobile-directory "~/Dropbox/MobileOrg")
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-font-lock-mode 1)

  (add-to-list 'evil-emacs-state-modes 'org-mode))

(provide 'my-org)
