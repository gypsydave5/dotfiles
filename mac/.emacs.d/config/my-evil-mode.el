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

  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  (evil-leader/set-key "v" 'split-window-right)

  (evil-leader/set-key "a" 'ag)
  (evil-leader/set-key "SPC" (lambda (interactive) 'highlight-remove-all)))


(provide 'my-evil-mode)
