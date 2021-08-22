;;; -*- lexical-binding: t; -*-
;;; exercism.el --- helper functions for the Exercism API
;;; Commentary:
;; 
;;; Code:

(defconst *exercism-config-location* "~/.config/exercism/user.json")

(defconst *exercism-token* nil)

(defun exercism-user-details ()
  (json-read-file *exercism-config-location*))

(defun exercism-api-key ()
  (or *exercism-token* (alist-get 'token (exercism-user-details))))

(defun exercism-submit-current-buffer ()
  (interactive)
  (shell-command (format "exercism submit %s" (buffer-file-name))))

(defun exercism-track-from-major-mode ()
  (cond ((eq major-mode 'lisp-mode) "common-lisp")))

(defun exercism-fetch-exercise (track exercise)
  (interactive
   (let* ((read-track (read-string "track: " (exercism-track-from-major-mode)))
          (read-exercise (completing-read "exercise: " (exercism-exercises-for-track read-track))))
     (list read-track read-exercise)))
  
  (shell-command (format "exercism download --exercise=%s --track=%s" exercise track)))

(defun exercism-browse-track-progress (track)
  (interactive (list (read-string "track: " (exercism-track-from-major-mode))))
  (browse-url (format "https://exercism.io/my/tracks/%s" track)))

(defun exercism-exercise-latest-solution-info (track exercise)
  (let*
      ((url-request-method "GET")
       (url-request-extra-headers
        `(("Authorization" . ,(format "Bearer %s" (exercism-api-key)))))
       (response
        (url-retrieve-synchronously
         (format "https://api.exercism.io/v1/solutions/latest?track_id=%s&exercise_id=%s" track exercise))))

    (with-current-buffer response
      (delete-region (point-min) url-http-end-of-headers)
      (json-parse-string (buffer-string) :array-type 'list :object-type 'alist))))

(defun exercism-exercises-for-track (track)
  "List of exercises for a given Exercism track"
  (let ((html (buffer->html (--exercism-client (format "tracks/%s/exercises" track)))))
    (mapcar
     (lambda (href) (file-name-base href))
     (delq nil (mapcar
                (lambda (el) (dom-attr el 'href))
                (dom-by-class html "exercise"))))))

(defun exercism-exercise-latest-solution-id (track exercise)
  "ID for the latest solution of a given exercise on an Exercism track"
  (let-alist
      (exercism-exercise-latest-solution-info track exercise)
    .solution.id))

(defun exercism-browse-latest-solution (track exercise)
  "Open your latest solution to a given exercise in the default browser"
  (interactive
   (list
    (read-string "track: " (exercism-track-from-major-mode))
    (read-string "exercise: " (exercism-current-exercise))))
  
  (let ((id (exercism-exercise-latest-solution-id track exercise)))
    (browse-url (format "https://exercism.io/my/solutions/%s" id))))

(defun --exercism-client (path)
  (--http-get (format "https://exercism.io/%s" path)))

(defun --exercism-api-client (path)
  (--http-get (format "https://api.exercism.io/%s" path)
              `(("Authorization" . ,(format "Bearer %s" (exercism-api-key))))))

(defun --http-get (url &optional headers)
  "Brutally, and unashamedly, returns the body of the response no matter what happens"
    (let*
        ((url-request-method "GET")
         (url-request-extra-headers headers)
       (response (url-retrieve-synchronously url)))
      (with-current-buffer response
        (delete-region (point-min) url-http-end-of-headers)
        (current-buffer))))

(defun buffer->html (buffer)
  (with-current-buffer buffer
    (libxml-parse-html-region (point-min) (point-max))))

(defun exercism-current-exercise ()
  "The name (slug) of the current exercise. Inferred from the file name (test or solution)"
  (string-replace "-test" "" (file-name-base (buffer-name))))

(provide 'exercism)

;;; exercism.el ends here
