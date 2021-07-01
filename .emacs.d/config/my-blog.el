(defvar *blog-post-directory* "/Users/gypsydave5/dev/projects/blog/posts/")

(defun string-replace (old new s)
  "Replace OLD with NEW in S."
  (declare (pure t) (side-effect-free t))
  (replace-regexp-in-string (regexp-quote old) new s t t))

(defun title-to-filename (title)
  "Change a blog post TITLE into an appropriate filename."
  (concat
   (string-join
    (mapcar
     (lambda (s) (replace-regexp-in-string "[^-a-z]" "" (downcase s)))
     (split-string title " ")) "-") ".md"))

(defun new-blog-post (title description)
  "Create new blog post with a TITLE and a DESCRIPTION."
  (let* ((buffer-name (title-to-filename title))
         (file-path (string-join (list *blog-post-directory* buffer-name)))
         (datestring (format-time-string "%Y-%m-%dT%H:%M:%S")))
    (if (get-buffer buffer-name) (error (format "Buffer already exists with name \"%s\"" buffer-name)))
    (create-file-buffer file-path)
    (with-current-buffer buffer-name
      (switch-to-buffer buffer-name)
      (set-visited-file-name file-path)
      (insert-front-matter buffer-name title description datestring))))

(defun insert-front-matter (buffer title description datestring)
  "Insert blog post frontmatter into a BUFFER using the TITLE, DESCRIPTION and DATESTRING."
  (with-current-buffer buffer
    (insert (format "---
title: %s
description: %s
published: false
date: %s
tags:
  - computerscience
  - beginners
---" title description datestring))))

(new-blog-post "I've had an amazing idea" "This is the description of the amazing idea")

;;; TESTS

(ert-deftest test-doesnot-clobber-buffer ()
  (with-temp-buffer
    (should-error (new-blog-post (buffer) "description"))))

(ert-deftest test-title-to-filename ()
  (should (equal (title-to-filename "My Blog Post") "my-blog-post.md"))
  (should (equal (title-to-filename "What, isn't this right?") "what-isnt-this-right.md")))

(ert-deftest test-insert-frontmatter ()
  (with-temp-buffer
    (insert-front-matter (buffer-name) "This is a title" "Description" "date")
    (should (equal (buffer-string) "---
title: This is a title
description: Description
published: false
date: date
tags:
  - computerscience
  - beginners
---"))))

(provide 'my-blog)
;;; my-blog.el ends here
