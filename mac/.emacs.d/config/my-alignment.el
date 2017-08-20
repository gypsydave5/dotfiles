;;; my-alignment.el  --- my settings for alignment in files
;;; Commentary:
;;; Code:
;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)
(provide 'my-alignment)
;;; my-alignment.el ends here
