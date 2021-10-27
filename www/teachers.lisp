;;;;teachers.lisp

(in-package :scale-your-violin)


(defun teacher-page ()
  (with-page (:title "Meet the Teachers")
    (:h1 "Studio Teachers")
    (:br)
    (:section
     (:h2 "Alexandra Kagan")
     (:h3 "Violin and Piano")
     (:p "American-born and Russian-raised violinist Alexandra Kagan is an active performer and teacher in the Denver Metropolitan Area, with over 8 years of violin and piano teaching experience. Through the pursuit of her Bachelor’s degree in Violin Performance at DePaul University and her Master’s degree at the University of Denver, Alexandra has studied with such renowned violinists and pedagogues as Olga Kaler, Linda Wang, and Igor Pikayzen, and participated in masterclasses led by Margaret Batjer, Kathleen Winkler, and Richard O’Neal among others. She enjoys performing new music and has premiered numerous works in Chicago and Denver in addition to participating in recording sessions in the Los Angeles and St Petersburg area. As a former member of the St Petersburg-based Violin Ensemble of the Anichkov Palace, Ms Kagan has performed in renowned music halls, such as the Mariinsky Theatre, Smolny Cathedral, St Petersburg Grand Philharmonic Hall, St Petersburg State Capella,Novgorod’s St Sophia Cathedral, Neumarkt’s Reitstadel, Makarska’s Main Square, the Swedish National History Museum in Stockholm, and Dubrovnik, among others.The ensemble won both local and international music competitions and toured France, Sweden, Croatia, and Germany extensively. Alexandra’s violin duet received an Honorable Mention at the Stockholm International Music Competition along with numerous state awards. This chamber music activity lead Alexandra for nomination and winning of the Star of the Palace, award given to the outstanding students of the Anichkov Palace of St Petersburg.
    
Alexandra has experience teaching beginner, intermediate, and advanced students of all ages. In particular, Ms Kagan is passionate about helping students through every stage of the audition process for festivals, schools, and orchestras.")
    (:h4 (:a :href "https://conservethebow.com/about" "Read More about Alex")))
    (:br)
    (:section
     (:h2 "Izaak Walton")
     (:h3 "Violin, Viola, and Mandolin")
     (:p "Izaak Walton
Get to know Izaak

Violin, Mandolin

Raised in Atlanta in a musical household, Izaak began playing at a young age under his parents’ instruction. He studied in the studios of Levon Ambartsumian, Shakhida Azimkodjaeva, and Dr. Michael Heald at the University of Georgia, and Raymond Leung of the Atlanta Symphony. Izaak graduated in 2015 from the University of Georgia with a degree in Violin Performance and a minor in English. He currently is studying towards his Masters in Violin Performance with Dr. Linda Wang at the University of Denver.

On the stage, he has been the second violinist in the Walton String Quartet since 2011, an events quartet based in Atlanta that has performed at various events across the southeast. He has performed with a variety of ensembles, from the Macon Symphony to Origin Creative, a recording orchestra based in Atlanta, GA. While primarily a classical musician, Izaak also dabbles in improvisatory styles, and had the opportunity to perform behind Kishi Bashi at the Georgia Theatre in April of 2014.

Izaak has taught around the Atlanta area since 2015, teaching a wide variety of ages, levels, and styles. As a teacher, he is especially passionate about helping students find the best sound on their instrument, both through technical setup and musical development. Finding a strong, focused sound as a foundation for their further studies can, and will, carry the student far into their musical explorations!"))))

(push
 (hunchentoot:create-prefix-dispatcher "/teachers.html" #'teacher-page)
 hunchentoot:*dispatch-table*)
    
