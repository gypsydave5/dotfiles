(add-hook 'nlinum-mode-hook
          (lambda ()
            (setq nlinum--width
                  (length (number-to-string
                           (count-lines (point-min) (point-max)))))
            (setq nlinum-format "%d ")))

(provide 'my-line-numbers)
