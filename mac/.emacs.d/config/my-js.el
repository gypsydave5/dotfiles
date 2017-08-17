(setq js-indent-level 2)

;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(add-hook 'js-mode-hook (lambda () (tern-mode t)))

;; (eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))

;; (add-hook 'js2-mode-hook 'ac-js2-mode)

;;(eval-after-load 'auto-complete
	 ;; (add-to-list 'ac-modes 'js-mode))

(eval-after-load 'tern
  (eval-after-load 'auto-complete
    '(progn
       (require 'tern-auto-complete)
       (tern-ac-setup))))

(provide 'my-js)
