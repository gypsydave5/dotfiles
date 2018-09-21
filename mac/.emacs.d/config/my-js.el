(setq js-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(eval-after-load "auto-complete"
  '(progn (add-to-list 'ac-modes 'js2-jsx-mode)
	  (add-to-list 'ac-modes 'js2-mode)))

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-strict-trailing-comma-warning nil)

(add-hook 'js2-mode-hook
          (lambda ()
            (define-key js2-mode-map (kbd "C-c C-e") 'nodejs-repl-send-last-expression)
            (define-key js2-mode-map (kbd "C-c C-j") 'nodejs-repl-send-line)
            (define-key js2-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
            (define-key js2-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
            (define-key js2-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))

(provide 'my-js)
;;; my-js.el ends here
