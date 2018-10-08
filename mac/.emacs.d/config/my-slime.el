;; slime --- stuff
;;; Commentary:
;;; Code:

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setf slime-lisp-implementations
      '((sbcl ("sbcl"))
        (roswell ("ros" "-Q" "run"))))

(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(add-hook 'lisp-mode-hook
	  (lambda ()
	    (set (make-local-variable lisp-indent-function)
		 'common-lisp-indent-function)))

(setq common-lisp-style "sbcl")
(add-hook 'slime-mode-hook 'my-lisp-hook)
(add-hook 'slime-mode-hook 'auto-complete-mode)

(add-hook 'slime-repl-mode-hook 'auto-complete-mode)
;; slime autocomplete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(eval-after-load "auto-complete"
                 '(add-to-list 'ac-modes 'slime-repl-mode))

;; eval buffer
(eval-after-load 'slime-mode
  '(define-key inferior-slime-mode-map
     (kbd "C-c C-a") 'slime-eval-buffer))

(require 'common-lisp-snippets)
(provide 'my-slime)
