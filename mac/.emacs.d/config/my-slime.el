;; slime
(setq slime-lisp-implementations
      '((clisp ("/usr/local/bin/clisp"))
        (sbcl ("/usr/local/bin/sbcl"))))
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)
(setq slime-contribs '(slime-fancy))

(add-hook 'slime-mode-hook 'my-lisp-hook)
(add-hook 'slime-mode-hook 'auto-complete-mode)

(evil-set-initial-state 'slime-repl-mode 'emacs)
(evil-set-initial-state 'magit-log-edit-mode 'emacs)

;; slime autocomplete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
(provide 'my-slime)
