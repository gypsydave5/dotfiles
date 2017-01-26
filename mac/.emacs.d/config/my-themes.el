;; colour themes
(progn
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (set-cursor-color "#0a9dff")
  (provide 'init-themes)
  (load-theme 'badwolf t)

  ;; powerline
  (require 'powerline)
  (powerline-default-theme)
  (require 'airline-themes)
  (load-theme 'airline-badwolf))

(provide 'my-themes)
