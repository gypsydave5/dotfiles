(require 'ac-geiser)

(progn
  (add-hook 'racket-mode-hook 'my-lisp-hook)
  (add-hook 'racket-mode-hook
	    (lambda ()
	      (setq geiser-active-implementations '(racket))))
  (add-hook 'scheme-mode-hook 'my-lisp-hook)
  (add-hook 'geiser-mode-hook 'ac-geiser-setup)
  (add-hook 'geiser-repl-mode-hook 'ac-geiser-setup))

(provide 'my-racket)
