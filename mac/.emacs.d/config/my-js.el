(setq js-indent-level 2)

(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js-mode-hook 'tern-mode)

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(eval-after-load 'tern
  (eval-after-load 'auto-complete
    '(progn
       (require 'tern-auto-complete)
       (add-to-list 'ac-modes 'js2-jsx-mode)
       (add-to-list 'ac-modes 'js2-mode)
       (tern-ac-setup))))

(eval-after-load "auto-complete"
  '(progn (add-to-list 'ac-modes 'js2-jsx-mode)
	  (add-to-list 'ac-modes 'js2-mode)))

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-strict-trailing-comma-warning nil)

(provide 'my-js)
;;; my-js.el ends here
