(progn
  (defun set-auto-complete-as-completion-at-point-function ()
    (setq completion-at-point-functions '(auto-complete)))

  (require 'ac-cider)
  (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
  (add-hook 'cider-mode-hook 'ac-cider-setup)
  (add-hook 'cider-mode-hook 'my-lisp-hook)
  (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

  (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
  (add-hook 'cider-repl-mode-hook 'my-lisp-hook)

  (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

  (eval-after-load "auto-complete"
    '(progn
       (add-to-list 'ac-modes 'cider-mode)
       (add-to-list 'ac-modes 'cider-repl-mode)))

  (eval-after-load 'cider
  '(progn
    (cider-add-to-alist 'cider-jack-in-dependencies
     "org.tcrawley/dynapath" "0.2.5")
    (cider-add-to-alist 'cider-jack-in-dependencies
     "com.cemerick/pomegranate" "0.4.0"))))

(provide 'my-cider)
