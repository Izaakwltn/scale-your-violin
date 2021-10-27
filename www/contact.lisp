;;;;contact.lisp

(in-package :scale-your-violin)

(defun contact-page ()
  (with-page (:title "Contact")
    (:header
     (:h1 "Contact Us"))
    (:section
     (:h2 "Send us an email at:")
     (:h3 (:a :href "mailto: scaleyourviolin@gmail.com" "scaleyourviolin@gmail.com"))
     (:h2 "Or visit our affiliate website:")
     (:h3 (:a :href "https://www.conservethebow.com" "conservethebow.com")))))

(push
 (hunchentoot:create-prefix-dispatcher "/contact.html" #'contact-page)
 hunchentoot:*dispatch-table*)
