;;;;blog.lisp

(in-package :scale-your-violin)

(defun blog-page ()
  (with-page (:title "Not that Kind of String Theory")
    (:header
     (:h1 "Not that Kind of String Theory"))
    (:section
     (:h3 "Blog coming soon"))))

(push
 (hunchentoot:create-prefix-dispatcher "/blog.html" #'blog-page)
 hunchentoot:*dispatch-table*)
