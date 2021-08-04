;;; init.el --- initial Emacs configuration file
;;  -*- mode: elisp -*-
;;; Commentary:
;; Built up over c. a year since 2016, organized into sub configuration files
;; found in `config` directory.
;;
;;; Code:

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(package-install-selected-packages)

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; enable ido mode
(require 'ido)
(ido-mode t)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (ruby-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)
(use-package which-key
  :ensure t
    :config
    (which-key-mode))

(use-package dash
  :ensure t)

(use-package inf-ruby
  :ensure t)

(use-package bnf-mode
  :ensure t)

(use-package magit
  :ensure t)

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
;; (require 'my-elisp)
;; (require 'my-slime)
(require 'my-helm)
;; (require 'my-window-management)
;; (require 'my-dash)
;; (require 'my-snippets)
;; (require 'my-ruby)
;; (require 'my-whitespace)
;; (require 'my-alignment)
;; (require 'my-ibuffer)
;; (require 'my-js)
;; (require 'my-cider)
;; (require 'my-racket)
(require 'my-themes)
;; (require 'my-spellchecker)
;; (require 'my-markdown)
(require 'my-org)
;; (require 'my-fonts)
;; (require 'my-flycheck)
;; ;; (require 'my-evil-mode)
;; (require 'my-irc)
;; (require 'my-rust)
(require 'my-go)
;; (require 'my-blog)

(setenv "DICPATH" "~/Library/Spelling")
(setenv "DICTIONARY" "en_GB")
(setq
  ispell-program-name
  "/usr/local/bin/hunspell")
(setq ispell-local-dictionary "en_GB")
(setq org-odt-preferred-output-format "docx")

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

;; keybindings...
(global-set-key (kbd "H-3")
                ;; hyper is fn
                (lambda ()
                  (interactive)
                  (insert-char #xa3)))


(load "/Users/gypsydave5/.opam/4.10.0/share/emacs/site-lisp/dune.el")
(add-to-list 'auto-mode-alist '("/dune\\'" . dune-mode))

(provide 'init)
;;; init.el ends here

(put 'scroll-left 'disabled nil)

(global-prettify-symbols-mode)



