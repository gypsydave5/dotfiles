;; slime
(setq slime-lisp-implementations
      '((clisp ("/usr/local/bin/clisp"))
	(sbcl ("/usr/local/bin/sbcl"))))

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)
(setq slime-contribs '(slime-fancy))

(add-hook 'slime-mode-hook 'my-lisp-hook)
(add-hook 'slime-mode-hook 'auto-complete-mode)
(add-hook 'slime-repl-mode-hook 'auto-complete-mode)

;; slime autocomplete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; eval buffer
(eval-after-load 'slime-mode
  '(define-key inferior-slime-mode-map (kbd "C-c C-a") 'slime-eval-buffer))

(require 'common-lisp-snippets)
(provide 'my-slime)
