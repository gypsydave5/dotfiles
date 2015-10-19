;; elisp
(progn
  (require 'elisp-slime-nav)
  (defun my-elisp-hook ()
    (elisp-slime-nav-mode)
    (eldoc-mode))
  (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)
  (add-hook 'emacs-lisp-mode-hook 'my-elisp-hook))

(provide 'my-elisp)
