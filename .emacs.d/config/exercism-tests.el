(load "exercism.el")

(ert-deftest test-the-exercism-client ()
  (let ((spy nil))
    (with-temp-buffer
      (insert "body")
      (cl-letf (((symbol-function 'url-retrieve-synchronously)
               (lambda (p) (setf spy p) (current-buffer))))
      (let ((response-body (--exercism-client "hello")))
        (should (equal "https://exercism.io/hello" spy))
        (should (equal "body" response-body)))))))
