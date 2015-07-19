(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("f08c2405a7e71e568b784ae0145a86e48e1b4ea8ba33d231a4ad21b52495de5e" "eaf4cb94ad96e1659f9254db8efb799deb1885e97884f8f971ff1e6a4114500a" "356f57a98f35c8ead5a349408cab69f8d4d92baea131e9531611d0d82190fedf" default)))
 '(electric-pair-mode t)
 '(evil-toggle-key "C-M-z")
 '(package-selected-packages
   (quote
    (dash-at-point monokai-theme ac-slime evil-surround evil-nerd-commenter evil-leader airline-themes powerline-evil powerline helm-ag-r dash ag coffee-mode xpm json-mode image+ graphviz-dot-mode helm-ag golden-ratio elisp-slime-nav slime helm evil)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(require 'package)
(package-initialize)

;; autocomplete
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

;; and, just for now, lets set evil mode on...
(require 'evil-leader)
(global-evil-leader-mode)
(require 'evil)
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "#" 'evilnc-comment-or-uncomment-lines)
(evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
  'elisp-slime-nav-describe-elisp-thing-at-point)
;;; tabbing between windows...
(define-key evil-normal-state-map (kbd "TAB") 'evil-window-next)

;; elisp
(progn 
  (require 'elisp-slime-nav)
  (defun my-lisp-hook ()
    (elisp-slime-nav-mode)
    (eldoc-mode))
  (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook))

;;slime
(setq inferior-lisp-program "/usr/local/bin/clisp")
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)
(setq slime-contribs '(slime-fancy))
;;; slime autocomplete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; helm
(require 'helm-config)
(helm-mode 1)
