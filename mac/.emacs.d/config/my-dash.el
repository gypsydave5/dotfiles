(require 'dash-at-point)
(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)
(evil-leader/set-key "d" 'dash-at-point)
(add-hook 'slime-mode-hook
          (lambda () (setq dash-at-point-docset "Common Lisp")))
(add-hook 'slime-repl-mode-hook
          (lambda () (setq dash-at-point-docset "Common Lisp")))
(add-hook 'coffee-mode
          (lambda () (setq dash-at-point-docset "coffeescript")))
(add-hook 'js2-mode
          (lambda () (setq dash-at-point-docset "nodejs")))

(provide 'my-dash)
