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
    (dictionary web-mode react-snippets ac-js2 ac-cider enh-ruby-mode robe magit inf-ruby clojure-snippets cider clojurescript-mode nlinum quack feature-mode smartparens evil-smartparens evil-lisp-state column-marker evil-paredit lispy paredit geiser evil-numbers ac-slime evil-matchit skewer-mode slime-repl slime typescript-mode tss helm-dash column-enforce-mode markdown-mode+ flymake-coffee js2-mode emmet-mode yasnippet exec-path-from-shell dash-at-point monokai-theme evil-surround evil-nerd-commenter evil-leader airline-themes powerline-evil powerline helm-ag-r dash ag coffee-mode xpm json-mode image+ graphviz-dot-mode helm-ag golden-ratio elisp-slime-nav helm evil)))
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

(add-to-list 'load-path (concat user-emacs-directory "config"))

;; editorconfig
(load "editorconfig")

(require 'my-evil-mode)
(require 'my-elisp)
(require 'my-slime)
(require 'my-helm)
(require 'my-window-management)
(require 'my-dash)
(require 'my-themes)
(require 'my-snippets)
(require 'my-ruby)
(require 'my-whitespace)
(require 'my-alignment)
(require 'my-ibuffer)
(require 'my-js)
(require 'my-spellchecker)
(require 'my-paredit)
(require 'my-line-numbers)
(require 'my-markdown)

;; autocomplete
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

;; shortcut to the joy of init.el
(global-set-key [f7] (lambda () (interactive) (find-file user-init-file)))
