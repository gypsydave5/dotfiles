(load "exercism.el")

(defun random-number (&optional n)
  (or n (setq n 100))
  (% (abs (random)) n))

(defun random-character ()
  (let ((alphanum (concat (cl-loop for c from 48 to 122 collect c))))
    (aref alphanum (random-number (- (length alphanum) 1)))))

(defun random-string (&optional n)
  (or n (setq n 20))
  (concat (cl-loop for s from 1 to n collect (random-character))))

(ert-deftest test-the-exercism-client ()
  (let ((spy nil)
        (path (random-string))
        (headers (random-string))
        (body (random-string)))
    (with-temp-buffer
      (insert headers)
      (insert body)
      (cl-letf (((symbol-function 'url-retrieve-synchronously)
                 (lambda (p) (setf spy p) (current-buffer)))
                (url-http-end-of-headers (+ 1 (length headers))))
        
      (let ((response-body (--exercism-client path)))
        (should (equal (concat "https://exercism.io/" path) spy))
        (should (equal body response-body)))))))
