;;; init.el --- initial Emacs configuration file
;;  -*- mode: elisp -*-
;;; Commentary:
;; Built up over c. a year since 2016, organized into sub configuration files
;; found in `config` directory.
;;
;;; Code:

;;  Disable splash screen (enable by changing t to 0)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-splash-screen t)

;; No scrollbars please, we're British
(scroll-bar-mode -1)

;; No toolbar either
(tool-bar-mode -1)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list '("~/info" "~/info/infoman"))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(chess-default-display '(chess-ics1 chess-images chess-plain))
 '(custom-enabled-themes '(wheatgrass))
 '(custom-safe-themes
   '("f30af3e23fd8b9be5bf29026c88a8972c3962e88e9697a5f07ac25068163f8b6" "3fa07dd06f4aff80df2d820084db9ecbc007541ce7f15474f1d956c846a3238f" "9b1c580339183a8661a84f5864a6c363260c80136bd20ac9f00d7e1d662e936a" "158013ec40a6e2844dbda340dbabda6e179a53e0aea04a4d383d69c329fba6e6" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "30289fa8d502f71a392f40a0941a83842152a68c54ad69e0638ef52f04777a4c" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "f08c2405a7e71e568b784ae0145a86e48e1b4ea8ba33d231a4ad21b52495de5e" "eaf4cb94ad96e1659f9254db8efb799deb1885e97884f8f971ff1e6a4114500a" "356f57a98f35c8ead5a349408cab69f8d4d92baea131e9531611d0d82190fedf" default))
 '(electric-pair-mode t)
 '(lsp-ocaml-lang-server-command '("ocamllsp"))
 '(ns-alternate-modifier 'meta)
 '(ns-function-modifier 'hyper)
 '(ns-right-alternate-modifier 'meta)
 '(ocamlformat-enable 'enable-outside-detected-project)
 '(org-agenda-files
   '("~/Dropbox/org-mode/builders.org" "~/Dropbox/org-mode/garden.org" "/Users/gypsydave5/Dropbox/org-mode/journal/20180906" "/Users/gypsydave5/Dropbox/org-mode/journal/20180908" "/Users/gypsydave5/Dropbox/org-mode/journal/20180910" "/Users/gypsydave5/Dropbox/org-mode/journal/20180911" "/Users/gypsydave5/Dropbox/org-mode/journal/20180912" "/Users/gypsydave5/Dropbox/org-mode/journal/20180913" "/Users/gypsydave5/Dropbox/org-mode/journal/20180917" "/Users/gypsydave5/Dropbox/org-mode/journal/20180922" "/Users/gypsydave5/Dropbox/org-mode/journal/20180928" "/Users/gypsydave5/Dropbox/org-mode/journal/20181002" "/Users/gypsydave5/Dropbox/org-mode/journal/20181003" "/Users/gypsydave5/Dropbox/org-mode/journal/20181008" "/Users/gypsydave5/Dropbox/org-mode/journal/20181009" "/Users/gypsydave5/Dropbox/org-mode/journal/20181019" "/Users/gypsydave5/Dropbox/org-mode/journal/20181204" "/Users/gypsydave5/Dropbox/org-mode/journal/20181205" "/Users/gypsydave5/Dropbox/org-mode/journal/20190214" "/Users/gypsydave5/Dropbox/org-mode/journal/20200419" "/Users/gypsydave5/Dropbox/org-mode/journal/20200420" "/Users/gypsydave5/Dropbox/org-mode/journal/20200421" "/Users/gypsydave5/Dropbox/org-mode/journal/20200422" "/Users/gypsydave5/Dropbox/org-mode/journal/20210210"))
 '(org-export-backends '(ascii html icalendar latex man md odt deck))
 '(package-selected-packages
   '(use-package lsp-ui lsp-mode restclient ox-gfm org2jekyll ob-typescript ox-reveal org-re-reveal ob-http htmlize org-static-blog unfill magit nov toc-mode calibredb cider clojure-mode dash dash-docs flycheck geiser go-mode helm json-reformat slime yasnippet rainbow-delimiters rust-mode markdown-mode org-journal lispy lispyville fuel go-eldoc go-autocomplete writegood-mode clojars minimal-theme plan9-theme paredit ## default-text-scale flycheck-rust common-lisp-snippets ensime typed-clojure-mode vimrc-mode rake handlebars-mode yaml-mode js2-refactor auctex ac-geiser toggle-test zoom-window aggressive-indent badwolf-theme nodejs-repl chess ac-slime gitignore-mode rvm lispyscript-mode dictionary react-snippets ac-js2 ac-cider robe clojure-snippets clojurescript-mode nlinum quack column-marker skewer-mode tss helm-dash column-enforce-mode markdown-mode+ emmet-mode exec-path-from-shell dash-at-point airline-themes powerline helm-ag-r ag xpm json-mode image+ helm-ag golden-ratio elisp-slime-nav))
 '(send-mail-function 'smtpmail-send-it)
 '(show-paren-mode t)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(tool-bar-mode nil)
 '(tramp-syntax 'default nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :family "Iosevka SS01")))))

(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;; (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
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

;; shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

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
;; (require 'my-evil-mode)
(require 'my-irc)
(require 'my-rust)
(require 'my-go)

;; fill width
(setq-default fill-column 80)

;; autocomplete
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
(ac-config-default)
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

;; default-text-zoom
(default-text-scale-mode 1)

(setq-default indent-tabs-mode nil)
(put 'upcase-region 'disabled nil)

;; nov-mode is an epub viewer
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; keybindings...
(global-set-key (kbd "H-3")
                ;; hyper is fn
                (lambda ()
                  (interactive)
                  (insert-char #xa3)))

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(add-hook 'tuareg-mode-hook
          (require 'ocamlformat)
          (lambda ()
            (setq tuareg-prettify-symbols-full t)
            (setq tuareg-prettify-symbols-extra-alist
                  (cons '("|>" . ?▷) tuareg-prettify-symbols-extra-alist))
            (setq tuareg-prettify-symbols-extra-alist
                  (cons '("'u" . ?υ) tuareg-prettify-symbols-extra-alist))
            (define-key tuareg-mode-map (kbd "C-M-<tab>") #'ocamlformat)
            ;; (add-hook 'before-save-hook #'ocamlformat-before-save)
            ))

(load "/Users/gypsydave5/.opam/4.10.0/share/emacs/site-lisp/dune.el")
(add-to-list 'auto-mode-alist '("/dune\\'" . dune-mode))

(provide 'init)
;;; init.el ends here

(put 'scroll-left 'disabled nil)

(global-prettify-symbols-mode)

;; some ereader shit here

(require 'calibredb)
(setq calibredb-root-dir "~/Dropbox/Books/remote_calibre_backup/calibre-lib")
(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
(setq calibredb-library-alist '(("~/Dropbox/Books/remote_calibre_backup/calibre-lib")))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
