;;;;scale-your-page.lisp
;;;;
(in-package :scale-your-violin)

"Page template for website as a whole."
(defmacro with-page ((&key title) &body body)
   `(spinneret::with-html-string
      (:doctype)
      (:html
       (:head
	(:meta :charset "utf-8")
	(:meta :name "viewport" :content "width=device-width, initial-scale=1")
	(:link :href "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	       :rel "stylesheet"
	       :integrity "sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	       :crossorigin "anonymous")
         (:title ,title)
	 (:nav
	  (:button (:a :href "index.html" "home"))
	  (:button (:a :href "contact.html" "contact"))))
         (:body ,@body)
	 (:footer "Scale Your Violin" (:a :href "https://www.github.com" "code at github.com")))))
