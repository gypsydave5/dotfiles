;; slime --- stuff
;;; Commentary:
;;; Code:

(use-package slime
  :init
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  :config
  (setq slime-lisp-implementations
	'((sbcl  ("/usr/local/bin/sbcl" "--dynamic-space-size" "2GB") :coding-system utf-8-unix))
	slime-net-coding-system 'utf-8-unix
	slime-export-save-file t
	slime-contribs '(slime-fancy slime-repl slime-scratch slime-trace-dialog)
	lisp-simple-loop-indentation  1
	lisp-loop-keyword-indentation 6
	lisp-loop-forms-indentation   6)
  (add-hook 'slime-load-hook            (lambda () (require 'slime-fancy)))
  (show-paren-mode 1))


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

(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

(require 'common-lisp-snippets)
(provide 'my-slime)

