(progn
  (require 'org)

  (use-package org
    :ensure org-plus-contrib
    :defer t
    :bind (("<backtab>" . org-shifttab))
    :init

    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    (setq org-log-done 'note)
    (global-set-key "\C-cl" 'org-store-link)
    (global-set-key "\C-ca" 'org-agenda)

    (global-font-lock-mode 1)

    (setq org-agenda-files (directory-files-recursively "~/Dropbox/org-mode" "\\.org$"))
    ;; (org-babel-do-load-languages
    ;;  'org-babel-load-languages
    ;;  '(;; other Babel languages
    ;;    (plantuml . t)
    ;;    (http . t)
    ;;    (scheme . t)
    ;;    (shell . t)
    ;;    (emacs-lisp . t)
    ;;    (lisp . t)))
    (setq org-plantuml-jar-path
          (expand-file-name "/usr/local/Cellar/plantuml/plantuml.jar"))
    (setq org-tag-persistent-alist
          '(("improve_practice" . nil)
            ("lisp" . nil)
            ("accessibility" . nil)
            ("oo" . nil)
            ("measure" . nil)
            ("blog" . nil))))

  (use-package org-web-tools
    :ensure t)

  (use-package org-journal
    :ensure t
    :init
    (setq org-journal-dir "~/Dropbox/org-mode/journal/"))

  (use-package ox-pandoc
    :ensure t))

(provide 'my-org)
              
