;; colour themes
(progn
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (provide 'init-themes)
  ;; powerline
  (require 'powerline)
  (powerline-default-theme)

  (load-theme 'plan9 t)
  (load-theme 'whiteboard t)
  (load-theme 'minimal-light t)

  ;; (require 'airline-themes)
  ;; (load-theme 'airline-sol)
  ;; (load-theme 'airline-silver)
  )
(provide 'my-themes)
