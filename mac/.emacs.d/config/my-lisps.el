(progn
  (defun my-lisp-hook ()
    "Settings and modes for all Lisps. Behold the power of the lambda!"
    (lispy-mode)
    (rainbow-delimiters-mode)
    (auto-complete-mode)
    (show-paren-mode)))

(provide 'my-lisps)
