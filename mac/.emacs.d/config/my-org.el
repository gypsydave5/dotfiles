(progn
  (require 'org)

  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-font-lock-mode 1)

  ;; active Org-babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;; other Babel languages
     (plantuml . t)
     (http . t)
     (emacs-lisp . t)
     (lisp . t)))

  ;; not sure where this should go - but for now here
  (setq org-plantuml-jar-path
        (expand-file-name "/usr/local/Cellar/plantuml/plantuml.jar"))

  ;; default tags for my life atm
  (setq org-tag-persistent-alist
        '(("improve_practice" . nil)
          ("lisp" . nil)
          ("accessibility" . nil)
          ("oo" . nil)
          ("measure" . nil)
          ("blog" . nil)))

  (require 'org-journal)
  (setq org-journal-dir "~/Dropbox/org-mode/journal/")
  (setq org-agenda-file-regexp "\\`[^.].*\\.org'\\|[0-9]+$")
  (setq org-agenda-files (list "~/Dropbox/org-mode/" "~/Dropbox/org-mode/journal")))
(provide 'my-org)
