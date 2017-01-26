(progn
  (require 'org)
  (setq org-mobile-directory "~/Dropbox/MobileOrg")
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-font-lock-mode 1)

  ;; active Org-babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '( ;; other Babel languages
     (plantuml . t)))

  ;; not sure where this should go - but for now here

  (setq org-plantuml-jar-path
      (expand-file-name "/usr/local/Cellar/plantuml/plantuml.jar")))

(provide 'my-org)
