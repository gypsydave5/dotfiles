;; elisp
(progn
  (require 'elisp-slime-nav)
  (defun my-lisp-hook ()
    (auto-complete-mode)
    (elisp-slime-nav-mode)
    (eldoc-mode))
  (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook))
(provide 'my-elisp)
