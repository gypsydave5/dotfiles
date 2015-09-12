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
 '(package-selected-packages
   (quote
    (inf-ruby clojure-snippets cider clojurescript-mode nlinum quack feature-mode smartparens evil-smartparens evil-lisp-state column-marker evil-paredit lispy paredit geiser evil-numbers ac-slime evil-matchit skewer-mode slime-repl slime typescript-mode tss helm-dash column-enforce-mode markdown-mode+ flymake-coffee js2-mode emmet-mode yasnippet exec-path-from-shell dash-at-point monokai-theme evil-surround evil-nerd-commenter evil-leader airline-themes powerline-evil powerline helm-ag-r dash ag coffee-mode xpm json-mode image+ graphviz-dot-mode helm-ag golden-ratio elisp-slime-nav helm evil)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))
(package-initialize)

;; (require 'exec-path-from-shell)
;; (exec-path-from-shell-initialize)

;; editorconfig
;; (load "editorconfig")

;; autocomplete
;; (setq tab-always-indent 'complete)
;; (add-to-list 'completion-styles 'initials t)

;; and, just for now, lets set evil mode on...
(setq evil-toggle-key "C-M-z")
(require 'evil-leader)
(global-evil-leader-mode)
(require 'evil)
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(evil-leader/set-leader ",")
(evil-leader/set-key "#"
  'evilnc-comment-or-uncomment-lines)
(evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
  'elisp-slime-nav-describe-elisp-thing-at-point)
;;; visual up and down please
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
;;; tabbing between windows...
(define-key evil-normal-state-map (kbd "TAB") 'evil-window-next)
(define-key evil-normal-state-map (kbd "<backtab>") 'evil-window-prev)
(evil-leader/set-key "v" 'split-window-right)
;;; vim-matchit? Yes please!
(require 'evil-matchit)
(global-evil-matchit-mode 1)
;;; ag
(evil-leader/set-key "a" 'ag)

;; elisp
(progn
  (require 'elisp-slime-nav)
  (defun my-lisp-hook ()
    (elisp-slime-nav-mode)
    (eldoc-mode))
  (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook))

;; slime
(setq inferior-lisp-program "/usr/local/bin/clisp")
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)
(setq slime-contribs '(slime-fancy))

;; slime autocomplete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-mode-hook 'slime)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))


;; helm???
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 0)
(helm-autoresize-mode 1)

;; colour themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(set-cursor-color "#0a9dff")
(provide 'init-themes)
(load-theme 'badwolf t)

;; powerline
(require 'powerline)
(require 'powerline-evil)
(powerline-default-theme)
(require 'airline-themes)
(load-theme 'airline-badwolf)

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

;; Dash
(require 'dash-at-point)
(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)
(evil-leader/set-key "d" 'dash-at-point)
(add-hook 'slime-mode-hook
          (lambda () (setq dash-at-point-docset "Common Lisp")))
(add-hook 'slime-repl-mode-hook
          (lambda () (setq dash-at-point-docset "Common Lisp")))
(add-hook 'coffee-mode
          (lambda () (setq dash-at-point-docset "coffeescript")))
(add-hook 'js2-mode
          (lambda () (setq dash-at-point-docset "nodejs")))

;; shortcut to the joy of init.el
(global-set-key [f7] (lambda () (interactive) (find-file user-init-file)))

;; autocomplete mode
;; (auto-complete-mode t)
;; (defun cd-pwd ()
;;   (interactive)
;;   (cd (getenv "PWD")))

;; javascript
;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (slime-js-minor-mode 1)))
;; (add-hook 'js2-mode-hook
;;           'ac-js2-mode)

;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)
