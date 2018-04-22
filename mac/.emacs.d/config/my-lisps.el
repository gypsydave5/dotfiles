;;; package --- Summary
;;; Commentary:
;;; Code:
(progn
  (defun my-lisp-hook ()
    "Settings and modes for all Lisps. Behold the power of the lambda!"
    (lispy-mode)
    (rainbow-delimiters-mode)
    (auto-complete-mode)
    (show-paren-mode)))

(eval-after-load "lispy"
  `(progn
     (lispy-define-key lispy-mode-map "E" 'lispy-eval-and-comment)))

(load "/Users/gypsydave5/quicklisp/clhs-use-local.el" t)

(provide 'my-lisps)
;;; my-lisps.el ends here