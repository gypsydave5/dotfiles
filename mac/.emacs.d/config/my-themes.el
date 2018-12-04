;; colour themes
(progn
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (set-cursor-color "#0a9dff")
  (provide 'init-themes)
  (load-theme 'badwolf t)
  (load-theme 'plan9 t)
  (load-theme 'minimal-light t)

  ;; powerline
  (require 'powerline)
  (powerline-default-theme)
  (require 'airline-themes)
  (load-theme 'airline-sol)
  (require 'powerline-evil)
  (powerline-evil-vim-color-theme)
  (custom-set-faces
   '(powerline-evil-normal-face ((t (:background "#859900" :foreground "#eee8d5"))))
   '(powerline-evil-insert-face ((t (:background "#268bd2" :foreground "#eee8d5"))))
   '(powerline-evil-visual-face ((t (:background "#cb4b16" :foreground "#eee8d5"))))
   '(powerline-evil-operator-face ((t (:background "#2aa198" :foreground "#eee8d5"))))
   '(powerline-evil-replace-face ((t (:background "#dc322f" :foreground "#eee8d5"))))
   '(powerline-evil-motion-face ((t (:background "#d33682" :foreground "#eee8d5"))))
   '(powerline-evil-emacs-face ((t (:background "#6c71c4" :foreground "#eee8d5"))))))

(provide 'my-themes)
