(progn
  (require 'yasnippet)
  (setq yas-snippet-dirs
        '("~/.emacs.d/yasnippets/snippets" ;; personal snippets
          "~/.emacs.d/config/snippets/lisp-mode"
          "~/.emacs.d/snippets/yasnippet-go"
          ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
          ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
          ;; "/path/to/yasnippet/snippets"         ;; the default collection
          ))
  (yas-global-mode 1))
(provide 'my-snippets)
