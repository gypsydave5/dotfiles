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
                    (lispy-define-key lispy-mode-map "E" 'lispy-eval-and-comment)
                    (add-to-list 'lispy-compat 'cider)
                    (add-to-list 'lispy-compat 'magit-blame-mode)
                    (setq lispy-comment-use-single-semicolon t)))

(setq geiser-chez-binary "chez")

(load "~/.roswell/lisp/quicklisp/clhs-use-local.el" t)

(provide 'my-lisps)
;;; my-lisps.el ends here
