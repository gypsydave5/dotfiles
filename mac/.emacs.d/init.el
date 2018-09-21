;;; init.el --- initial Emacs configuration file
;;  -*- mode: elisp -*-
;;; Commentary:
;; Built up over c. a year since 2016, organized into sub configuration files
;; found in `config` directory.
;;
;;; Code:

;;  Disable splash screen (enable by changing t to 0)
(setq inhibit-splash-screen t)

;; No scrollbars please, we're British
(scroll-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list '("~/info"))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes '(wheatgrass))
 '(custom-safe-themes
   '("946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "f08c2405a7e71e568b784ae0145a86e48e1b4ea8ba33d231a4ad21b52495de5e" "eaf4cb94ad96e1659f9254db8efb799deb1885e97884f8f971ff1e6a4114500a" "356f57a98f35c8ead5a349408cab69f8d4d92baea131e9531611d0d82190fedf" default))
 '(electric-pair-mode t)
 '(org-agenda-files
   '("~/Dropbox/org-mode/pdp-todo.org" "/Users/dwo3984/Dropbox/org-mode/journal/20180906" "/Users/dwo3984/Dropbox/org-mode/journal/20180908" "/Users/dwo3984/Dropbox/org-mode/journal/20180910" "/Users/dwo3984/Dropbox/org-mode/journal/20180911" "/Users/dwo3984/Dropbox/org-mode/journal/20180912" "/Users/dwo3984/Dropbox/org-mode/journal/20180913" "/Users/dwo3984/Dropbox/org-mode/journal/20180917"))
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(org-trello-files '("~/dev/springer/fleet/trello.org") nil (org-trello))
 '(package-selected-packages
   '(bash-completion common-lisp-snippets indium ensime typed-clojure-mode vimrc-mode rake kotlin-mode handlebars-mode yaml-mode evil-leader jq-mode evil-commentary evil-org js2-refactor go-mode evil-surround evil auctex intero haskell-mode ac-geiser racket-mode projectile toggle-test zoom-window aggressive-indent plantuml-mode badwolf-theme lua-mode nodejs-repl chess ac-slime slime gitignore-mode rvm rainbow-delimiters lispyscript-mode dictionary web-mode react-snippets ac-js2 ac-cider enh-ruby-mode robe magit inf-ruby clojure-snippets cider clojurescript-mode nlinum quack feature-mode smartparens column-marker lispy geiser skewer-mode typescript-mode tss helm-dash column-enforce-mode markdown-mode+ js2-mode emmet-mode yasnippet exec-path-from-shell dash-at-point airline-themes powerline helm-ag-r dash ag xpm json-mode image+ graphviz-dot-mode helm-ag golden-ratio elisp-slime-nav helm))
 '(send-mail-function 'smtpmail-send-it)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(tramp-syntax 'default nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#141413" :foreground "#f8f6f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width semi-condensed :foundry "nil" :family "Fira Code"))))
 '(fontn-lock-comment-face ((t (:foreground "#998f84" :slant oblique))))
 '(linum ((t (:background "color-235" :foreground "#666462")))))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "org" (concat proto "://orgmode.org/elpa/")))
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(package-install-selected-packages)

;; enable ido mode
(require 'ido)
(ido-mode t)

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path (concat user-emacs-directory "config"))

(require 'my-emacs)
(require 'my-line-numbers)
(require 'my-lisps)
(require 'my-elisp)
(require 'my-slime)
(require 'my-helm)
(require 'my-window-management)
(require 'my-dash)
(require 'my-snippets)
(require 'my-ruby)
(require 'my-whitespace)
(require 'my-alignment)
(require 'my-ibuffer)
(require 'my-js)
(require 'my-cider)
(require 'my-racket)
(require 'my-themes)
(require 'my-spellchecker)
(require 'my-markdown)
(require 'my-org)
(require 'my-fonts)
(require 'my-flycheck)
(require 'my-evil-mode)
(require 'my-irc)

;; fill width
(setq-default fill-column 80)

;; autocomplete
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
(global-auto-complete-mode t)

;; autosave files now go in the user-emacs-directory
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t)))
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory "auto-backup"))))
(setq auto-save-visited-file-name 1)

;; shortcut to the joy of init.el
(global-set-key [f7] (lambda () (interactive) (find-file user-init-file)))

;; ansi color please
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

;; Magit
(global-set-key (kbd "C-c g") 'magit-status)

;; shell
(exec-path-from-shell-initialize)

(setq-default indent-tabs-mode nil)
(put 'upcase-region 'disabled nil)

(provide 'init)
;;; init.el ends here
