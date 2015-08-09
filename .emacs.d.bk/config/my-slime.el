;; slime
(setq slime-lisp-implementations
      '((sbcl ("/usr/local/bin/sbcl"))
      '(clisp ("/usr/local/bin/clisp"))))
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)
(setq slime-contribs '(slime-fancy))
(add-hook 'slime-mode-hook 'auto-complete-mode)

;; slime autocomplete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
(provide 'my-slime)