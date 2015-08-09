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
    (column-marker evil-paredit lispy paredit geiser evil-numbers ac-slime evil-matchit skewer-mode slime-repl slime typescript-mode tss helm-dash column-enforce-mode markdown-mode+ flymake-coffee js2-mode emmet-mode yasnippet exec-path-from-shell dash-at-point monokai-theme evil-surround evil-nerd-commenter evil-leader airline-themes powerline-evil powerline helm-ag-r dash ag coffee-mode xpm json-mode image+ graphviz-dot-mode helm-ag golden-ratio elisp-slime-nav helm evil)))
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
(require 'editorconfig)

;; shortcut to the joy of init.el
(global-set-key [f7] (lambda () (interactive) (find-file user-init-file)))
(yas-global-mode 1)

;; and, just for now, lets set evil mode on...
(require 'my-evil-mode)
(require 'my-ibuffer)
(require 'my-alignment)

;;; ag
(evil-leader/set-key "a" 'ag)

(require 'my-elisp)
(require 'my-slime)
(require 'my-helm)
(require 'my-themes)
(require 'my-window-management)
(require 'my-dash)

;; autocomplete mode
(global-auto-complete-mode)
(defun cd-pwd ()
  (interactive)
  (cd (getenv "PWD")))

;; javascript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook (set-variable 'js-indent-level 2))
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (slime-js-minor-mode 1)))
;; (add-hook 'js2-mode-hook
;;           'ac-js2-mode)

;; (require 'exec-path-from-shell)
;; (exec-path-from-shell-initialize)

;; editorconfig

;; autocomplete
;; (setq tab-always-indent 'complete)
;; (add-to-list 'completion-styles 'initials t)
