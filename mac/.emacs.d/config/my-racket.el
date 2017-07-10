(progn
  (add-hook 'racket-mode-hook 'my-lisp-hook)
  (add-hook 'racket-mode-hook
	    (lambda ()
	      (setq geiser-active-implementations '(racket)))))
(provide 'my-racket)
