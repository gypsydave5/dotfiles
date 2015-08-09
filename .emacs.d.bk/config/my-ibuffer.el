;; custom settings for ibuffer with evil mode
(eval-after-load 'ibuffer
  '(progn
     (evil-set-initial-state 'ibuffer-mode 'normal)
     (evil-define-key 'normal ibuffer-mode-map
       ;;; navigation
       (kbd "j") 'evil-next-line
       (kbd "k") 'evil-previous-line
       ;;; opening
       (kbd "t") 'ibuffer-visit-buffer
       ;;; marking
       (kbd "v") 'ibuffer-toggle-marks)))

(provide 'my-ibuffer)

