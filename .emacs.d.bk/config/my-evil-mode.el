(progn 
  (setq evil-toggle-key "C-M-z")
  (require 'evil-leader)
  (global-evil-leader-mode)
  (require 'evil)
  (evil-mode 1)
  (require 'evil-surround)
  (global-evil-surround-mode 1)
  (require 'evil-matchit)
  (global-evil-matchit-mode 1)
  (require 'evil-numbers)

  (evil-leader/set-leader ",")
  (evil-leader/set-key "#"
    'evilnc-comment-or-uncomment-lines)
  (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
    'elisp-slime-nav-describe-elisp-thing-at-point)

  (define-key evil-normal-state-map (kbd "TAB") 'evil-window-next)
  (define-key evil-normal-state-map (kbd "<backtab>") 'evil-window-prev)
  (evil-leader/set-key "v" 'split-window-right)
  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt))

(provide 'my-evil-mode)
