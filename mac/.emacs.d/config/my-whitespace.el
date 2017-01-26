(defun delete-trailing-whitespace-of-current-line ()
  "Delete all the trailing whitespace on the current line.
     All whitespace after the last non-whitespace character in a line is deleted.
     This respects narrowing, created by \\[narrow-to-region] and friends."
  (interactive "*")
  (save-match-data
    (save-excursion
      (move-to-column 0)
      (if (re-search-forward "\\s-$" nil t)
          (progn
            (skip-syntax-backward "-" (save-excursion (forward-line 0) (point)))
              (delete-region (point) (match-end 0)))))))

(progn
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(provide 'my-whitespace)
