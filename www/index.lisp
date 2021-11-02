;;;;index.lisp

(in-package :scale-your-violin)

(defun index-page ()
  (with-page (:title "Scale Your Violin")
    (:header
     (:h1 "Scale Your Violin"))
    (:section
     (:img :src "IMG_0036.JPG"
	   :width "600"
	   :height "auto")
     (:p "Hello, welcome to Scale Your Violin, a virtual violin studio dedicated to helping students find their best sound, fastest progress, and most effective technique possible!")

     (:p "Check out the " (:a :href "/blog.html" "blog,"))
     (:p "check your resonance with the " (:a :href "/resonance.html" "resonance calculator,"))
     (:p "Or get in touch:")
     (:p (:a :href "mailto: izaakviolin@gmail.com" "izaakviolin@gmail.com")))))

(push
 (hunchentoot:create-prefix-dispatcher "/index.html" #'index-page)
 hunchentoot:*dispatch-table*)
