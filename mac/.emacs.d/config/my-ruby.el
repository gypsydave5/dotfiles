(progn
  (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby))
  (add-hook 'ruby-mode-hook 'robe-mode)
  (add-hook 'robe-mode-hook 'ac-robe-setup)
  (eval-after-load "auto-complete" '(add-to-list 'ac-modes 'robe-mode)))
(provide 'my-ruby)
