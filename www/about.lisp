;;;;about.lisp

(in-package :scale-your-violin)

(defun about-page ()
  (with-page (:title "About")
    (:header
     (:h1 "About"))
    (:section
     (:h3 "Izaak Walton")
     (:p "Hello! I'm Izaak, a violinist and teacher of violin, viola, and mandolin based out of Denver, CO.")
     (:br)
     (:iframe :width "560"
	      :height "315"
	      :src "https://www.youtube.com/embed/heN-QRplYyo"
	      :title "YouTube video player")
     (:p "As a teacher, I am particularly passionate about helping students find the best sound on their instrument, both through technical setup, ear training, and musical development. Finding a strong, focused sound as a foundation for their further studies can, and will, carry the student far into their musical explorations!")
     (:p " I received my Bachelors in Violin Performance from the University of Georgia, studying with Levon Ambartsumian, Shakhida Azimkodjaeva, and Dr. Michael Heald, in addition to Raymond Leung of the Atlanta Symphony. In 2017 I moved out here to Denver, receiving my Masters in Violin Performance with Dr. Linda Wang at the University of Denver." ))))

(push (hunchentoot:create-prefix-dispatcher "/about.html" #'about-page)
      hunchentoot:*dispatch-table*)
