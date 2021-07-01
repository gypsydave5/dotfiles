;;; my-blog.el --- Helper functions for my blog
;;; Commentary:
;;

;;; Code:

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

(defun new-blog-post (title description &optional tags)
  "Create new blog post with a TITLE and a DESCRIPTION and an optional list of TAGS."
  (interactive (list (read-string "Title: ") (read-string "Description: ") (let ((tags-string (read-string "Tags: ")))
                                                                             (and tags-string (split-string tags-string " ")))))
  (let* ((buffer-name (title-to-filename title))
         (file-path (string-join (list *blog-post-directory* buffer-name)))
         (datestring (format-time-string "%Y-%m-%d %H:%M:%S")))

    (if (get-buffer buffer-name) (error (format "Buffer already exists with name \"%s\"" buffer-name)))

    (create-file-buffer file-path)
    (with-current-buffer buffer-name
      (switch-to-buffer buffer-name)
      (set-visited-file-name file-path)
      (markdown-mode)
      (insert-front-matter buffer-name title description datestring tags))))

(defun insert-front-matter (buffer title description datestring &optional tags)
  "Insert blog post frontmatter into a BUFFER using the TITLE, DESCRIPTION, DATESTRING and an optional list of TAGS."
  (with-current-buffer buffer
    (insert (format "---
title: %s
description: %s
published: false
date: %s
tags:%s
---

" title description datestring (if tags (concat "\n  - " (string-join tags "\n  - ")) "")))))

;;; TESTS

(ert-deftest test-doesnot-clobber-buffer ()
  (with-temp-buffer
    (should-error (new-blog-post (buffer) "description"))))

(ert-deftest test-title-to-filename ()
  (should (equal (title-to-filename "My Blog Post") "my-blog-post.md"))
  (should (equal (title-to-filename "What, isn't this right?") "what-isnt-this-right.md")))

(ert-deftest test-insert-frontmatter ()
  (with-temp-buffer
    (insert-front-matter (buffer-name) "This is a title" "Description" "date" '("hello" "mum"))
    (should (equal (buffer-string) "---
title: This is a title
description: Description
published: false
date: date
tags:
  - hello
  - mum
---

"))))

(provide 'my-blog)
;;; my-blog.el ends here
