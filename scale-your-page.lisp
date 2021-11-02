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
	(:link :rel "stylesheet"
	       :href "https://cdn.simplecss.org/simple.min.css")
        (:title ,title))
       (:header
	 (:nav
	  (:a :style "color:black;" :href "index.html" "Scale Your Violin")
	  (:a :href "about.html" "About")
	  (:a :href "blog.html" "Blog")
	  (:a :href "resonance.html" "Resonance Calculator")
	  (:a :href "contact.html" "Contact")))
         (:body ,@body)
	 (:footer "Scale Your Violin "
		  (:a :href "https://www.github.com/Izaakwltn/scale-your-violin"
		            "code at github.com")))))
