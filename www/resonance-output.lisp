;;;;resonance-output.lisp

(in-package :scale-your-violin)

;;;;------------------------------------------------------------------------
;;;;Instrument Assessment
;;;;------------------------------------------------------------------------

(defvar instrument-parse-list '(("violin"
				 (vibratsia::luthier 'violin '(196 293.66 440 659.25)))
				 ("VIOLA"
				  (vibratsia::luthier 'viola '(130.8 196 293.66 440)))
				("CELLO"
				 (vibratsia::luthier 'cello '(65.4 98 146.8  220)))
				("BASS"
				 (vibratsia::luthier 'bass '(65.4 98 146.8  220)))))

(defvar instr-assessment)

(hunchentoot::define-easy-handler (instrument-assess :uri "/instrument-assess")
    (instrument-option)
  (setf (hunchentoot:content-type*) "text/html")
  (setq instr-assessment (vibratsia::assess-instrument
	   (eval (second (assoc instrument-option instrument-parse-list :test #'string-equal)))))
  (with-page (:title "Instrument Resonance Profile")
    (:header
     (:h1 "Resonance Calculator")
     (:h2 "Instrument Assessment")
     (:p "A comprehensive analysis of the resonant keys and frequencies on the violin. "))
    (:section
     (:h5 (format nil "Instrument name: ~a"
		  (vibratsia::name (vibratsia::instrument instr-assessment)))))
    (:section
     (:h5 (format nil "Open-strings:~%"))
     (:ul (loop for s in (vibratsia::strings (vibratsia::instrument instr-assessment))
		do (:li (format nil "~a-~a Frequency: ~a"
			   (vibratsia::note-name s)
			   (vibratsia::octave s)
			   (vibratsia::freq-float s))))))
    (:section
     (:h5 (format nil "Most Resonant Keys:"))
     (:ul (loop for k in (vibratsia::key-ranks instr-assessment)
		do (:li (format nil "~a ~a, resonance rating: ~a"
				(second k)
				(third k)
				(first k))))))
    (:section
     (:h5 (format nil "Most Resonant Notes:"))
     (:ul (loop for n in (vibratsia::note-ranks instr-assessment)
		do (:li (format nil "~a-~a Frequency: ~a"
				(vibratsia::note-name (second n))
				(vibratsia::octave (second n))
				(vibratsia::freq-float (second n)))))))
    (:button (:a :href "/resonance.html" "Try Another Calculation" ))))


;;;;------------------------------------------------------------------------
;;;;Scale Assessment
;;;;------------------------------------------------------------------------
;(vibratsia::assess-scale (vibratsia::build-scale root-option quality-option ;3) instrument-option)

;(defvar quality-parse-list '(("major" 
									       
						 
;(defvar scale-assessment)

;(hunchentoot::define-easy-handler (scale-assess :uri "/scale-assess")
;	(root-option quality-option octave-option instrument-option)
;  (setf (hunchentoot:content-type*) "text/html")
;  (setq scale-assessment (vibratsia::scale-assessment 
;  (format nil "~a ~a ~a ~a" root-option quality-option octave-option instrument-option))))

;;;;find the lowest iteration of the key on the instrument, generate a 3 octave scale, return
					;the scale assessment

;;;;------------------------------------------------------------------------
;;;;Note Assessment
;;;;------------------------------------------------------------------------

(defvar note-assessment)

(hunchentoot::define-easy-handler (note-assess :uri "/note-assess") (note-option instrument-option)
  (setf (hunchentoot:content-type*) "text/html")
  (setq note-assessment
	(vibratsia::assess-note (first
				 (freq-to-note (parse-float:parse-float note-option)))
			        (second (freq-to-note (parse-float:parse-float note-option)))
				(eval (second
				       (assoc instrument-option
					      instrument-parse-list :test #'string-equal)))))
  (with-page (:title "Instrument Resonance Profile")
    (:header
     (:h1 "Resonance Calculator")
     (:h2 "Note-instrument Assessment")
     (:p (format nil "A comprehensive analysis of the note, ~a-~a, as played on the ~a"
		 (first (freq-to-note (parse-float:parse-float note-option)))
		 (second (freq-to-note (parse-float:parse-float note-option)))
		 instrument-option)))
    (:section
     (:h5 (format nil "Sympathetic Vibration Rating: ~a" (vibratsia::rating note-assessment))))
    (:section
     (:h5 "List of Resonant Frequencies:")
     (:ul
      (loop for note in (vibratsia::res-list note-assessment)
	    if (equal (second note) 'string)
	      do (:li (:b (format nil "~a ~a" (first note) (second note))))
	    else
	      do (:ul
		  (loop for n in note
			do (:li (format nil "~a" n)))))))
    (:button (:a :href "/resonance.html" "Try Another Calculation"))))
