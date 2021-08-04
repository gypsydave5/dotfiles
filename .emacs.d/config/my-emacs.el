;;; my-emacs.el --- emacs settings

;;; Commentary:
;; 

;;; Code:

;;  Disable splash screen (enable by changing t to 0)
(setq inhibit-splash-screen t)

;; No scrollbars please, we're British
(scroll-bar-mode -1)

;; No toolbar either
(tool-bar-mode -1)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(use-package flycheck
  :ensure t)

(use-package dash
  :ensure t)

(provide 'my-emacs)
  
;;; my-emacs.el ends here
