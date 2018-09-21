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
     (plantuml . t)))

  ;; not sure where this should go - but for now here
  (setq org-plantuml-jar-path
        (expand-file-name "/usr/local/Cellar/plantuml/plantuml.jar"))

  (require 'org-journal)
  (setq org-journal-dir "~/Dropbox/org-mode/journal/")
  (setq org-agenda-files (list "~/Dropbox/org-mode/" "~/Dropbox/org-mode/journal"))
  (setq org-agenda-file-regexp "\\`[^.].*\\.org'\\|[0-9]+$")

  ;; Org-trello
  (require 'org-trello)
  (custom-set-variables '(org-trello-files '("~/dev/springer/fleet/trello.org"))))
(provide 'my-org)
