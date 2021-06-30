(defvar *blog-post-directory* "/Users/gypsydave5/dev/projects/blog/posts/")

(defun title-to-file (title)
  (concat
   (string-join
    (split-string
     (replace-regexp-in-string "[^-a-z ]" "" (downcase title) t t) " ") "-") ".md"))



(ert-deftest test-title-to-filename ()
  (should (equal (title-to-file "My Blog Post") "my-blog-post.md"))
  (should (equal (title-to-file "What, isn't this right?") "what-isnt-this-right.md")))

(defun* new-blog-post (title description)
  (let* ((buffer-name (string-join (list name ".md")))
         (file-path (string-join (list *blog-post-directory* buffer-name))))
    (create-file-buffer file-path)
    (switch-to-buffer buffer-name)
    (insert-front-matter buffer-name)))


(defun string-replace (old new s)
  "Replace OLD with NEW in S."
  (declare (pure t) (side-effect-free t))
  (replace-regexp-in-string (regexp-quote old) new s t t))

(defun* insert-front-matter (buffer-name title description)
  (let* ((time (format-time-string "%Y-%m-%dT%H:%M:%S")))
    (with-current-buffer buffer-name
      (insert (format "---
title: %s
description: %s
published: false
date: %s
tags:
  - computerscience
  - beginners
---" title description time)))))

(new-blog-post "amazing")
