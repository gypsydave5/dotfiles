;; beloved golden ratio!
(require 'golden-ratio)
(golden-ratio-mode t)
(setq golden-ratio-extra-commands
  (append golden-ratio-extra-commands
    '(evil-window-left
      evil-window-right
      evil-window-up
      evil-window-down
      evil-window-next
      evil-window-prev
      select-window-1
      select-window-2
      select-window-3
      select-window-4
      select-window-5)))
(provide 'my-window-management)
