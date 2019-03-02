;;; Code

(progn
  (setq evil-default-state 'emacs)
  (require 'evil-leader)
  (global-evil-leader-mode)

  (require 'evil)
  (evil-mode 1)

  (require 'evil-surround)
  (global-evil-surround-mode 1)
  ;; (require 'evil-matchit)j
  ;; (global-evil-matchit-mode 1)
  ;; (require 'evil-numbers)

  (evil-leader/set-leader ",")
  (define-key evil-normal-state-map (kbd "TAB") 'evil-window-next)
  (define-key evil-normal-state-map (kbd "<backtab>") 'evil-window-prev)
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  (evil-leader/set-key "v" 'split-window-right)
  (evil-leader/set-key "a" 'ag)
  (evil-leader/set-key "SPC" (lambda (interactive) 'highlight-remove-all))

  (setq evil-default-state 'emacs))

(provide 'my-evil-mode)
