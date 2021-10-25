;;;;resonance.lisp
;;;;Resonance Calculator

(in-package :scale-your-violin)



(defvar note-option-list (mapcar #'vibratsia::freq-to-note
			     (vibratsia::frequency-ladder 16.35 4185.6)))

(defvar instrument-option-list '("violin" "viola" "cello" "bass"))

(defvar instrument-parse-list '(("violin"
				 (vibratsia::luthier 'violin '(196 293.66 440 659.25)))
				 ("VIOLA"
				  (vibratsia::luthier 'viola '(130.8 196 293.66 440)))
				("CELLO"
				 (vibratsia::luthier 'cello '(65.4 98 146.8  220)))
				("BASS"
				 (vibratsia::luthier 'bass '(65.4 98 146.8  220)))))
				 ;("HARDINGFELE"
				  ;(vibratsia::luthier 'hardanger-fiddle
				  ; vibratsia::hardanger-fiddle-strings))))

(defvar root-option-list '(C C# D D# E F F# G G# A Bb B))

(defvar quality-option-list
  '(major ionian dorian phrygian lydian mixolydian aeolian nat-min mel-min har-min locrian))

(defvar instrument-value ())
(defvar note-value ())
(defvar scale-value ())

;;;;Maybe move to a different file
;(defmacro with-page ((&key title) &body body)
;   `(spinneret::with-html-string
;      (:doctype)
;      (:html
 ;      (:head;
;	(:meta :charset "utf-8")
;	(:meta :name "viewport" :content "width=device-width, initial-scale=1")
;	(:link :href "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
;	       :rel "stylesheet"
;	       :integrity "sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
;	       :crossorigin "anonymous")
 ;        (:title ,title)
;	 (:nav
;	  (:button (:a :href "index.html" "home"))
;	  (:button (:a :href "contact.html" "contact"))))
 ;        (:body ,@body)
;	 (:footer "Scale Your Violin" (:a :href "https://www.github.com" "code at github.com")))))

(defun resonance-calculator ()
  (with-page (:title "Resonance Calculator")
    (:header
     (:h1 "Resonance Calculator"))
    (:section
     (:p "Every note played on an instrument, or even sung, is actually a composite sound consisting of approximately 32 overtones. On stringed instruments, these overtones can be isolated using harmonics.

Sympathetic vibration occurs when the overtones of an executed note overlap with the overtones of an open string. Harmonic nodes, as the overtones are called in string geography, respond to similar frequencies, and vibrate the open string audibly, and sometimes even visually."))
    (:section
     (:h2 "Instrument Assessment")
     (:h3 "Returns a resonance profile for a specified instrument")
     (:p "Select an instrument")
     (:form :action "/instrument-assess" :id "instrument-assess"
      (:select :name "instrument-option" :form "instrument-assess"
        (loop for instrument in scale-your-violin::instrument-option-list
	      do (:option :value instrument (format nil "~a" instrument))))
      (:input :type "submit" :value "instrument-assess" :class "button")))
    (:section
     (:h2 "Scale Assessment")
     (:h3 "Returns a resonance profile for a specific scale/key on a particular instrument")
     (:p "Select the root, quality, and number of octaves for the scale, and the instrument.")
     (:form :action "/scale-assess" :id "scale-assess"
      (:select :name "root-option" :form "scale-assess"
	(loop for r in scale-your-violin::root-option-list
	      do (:option :value r
			  (format nil "~A" r))))
      (:select :name "quality-option" :form "scale-assess"
	(loop for qual in scale-your-violin::quality-option-list
	      do (:option :value qual
			  (format nil "~a" qual))))
      (:select :name "octave-option" :form "scale-assess"
	(loop for i from 1 to 7
	      do (:option :value i
			  (format nil "~a" i))))
      (:select :name "instrument-option" :form "scale-assess"
        (loop for instrument in scale-your-violin::instrument-option-list
	      do (:option :value instrument (format nil "~a" instrument))))
      (:input :type "submit" :value "scale-assess" :class "button")))
    (:section
     (:h2 "Note Assessment")
     (:h3 "Returns a resonance profile for a specified note on a specified instrument")
     (:p "Select a note and an instrument")
     (:form :action "/note-assess" :id "note-assess"
            :method "get"
	    ;:onsubmit (and (setq note-value (spinneret::value note-options))
				 ;(setq instrument-value (spinneret::value instrument-options)))
      (:select :name "note-option" :form "note-assess"
	(loop for note in scale-your-violin::note-option-list
	      do (:option :value note
			  (format nil "~a-~a" (first note) (second note)))))
      (:select :name "instrument-option" :form "note-assess"
	(loop for instrument in scale-your-violin::instrument-option-list
	      do (:option :value instrument
			  (format nil "~a" instrument))))
     (:input :type "submit" :value "note-assess" :class "button" )))))

(hunchentoot::define-easy-handler (note-assess :uri "/note-assess") (note-option instrument-option)
  (setf (hunchentoot:content-type*) "text/html")
  (format nil "~a ~a" note-option instrument-option))

(hunchentoot::define-easy-handler (scale-assess :uri "/scale-assess")
	(root-option quality-option octave-option instrument-option)
  (setf (hunchentoot:content-type*) "text/plain")
  (format nil "~a ~a ~a ~a" root-option quality-option octave-option instrument-option))

;(hunchentoot::define-easy-handler (instrument-assess :uri "/instrument-assess");
;	(instrument-option)
 ; (setf (hunchentoot:content-type*) "text/html")
  ;(format nil "~a ~a ~a ~a" ;(vibratsia::assess-instrument
;	  instrument-option
;	  (type-of instrument-option)
;	  (type-of (first (first instrument-parse-list)))
;	  ;(vibratsia::assess-instrument
;	  (vibratsia::assess-instrument
;	   (eval (second (assoc instrument-option instrument-parse-list :test #'string-equal))))))
	  ;(assoc (intern instrument-option) instrument-parse-list :test #'string=)))
  ;(with-page (:title "Resonance Output" )
					;
(defvar instr-assessment)
(hunchentoot::define-easy-handler (instrument-assess :uri "/instrument-assess")
    (instrument-option)
  (setf (hunchentoot:content-type*) "text/html")
  (setq instr-assessment (vibratsia::assess-instrument
	   (eval (second (assoc instrument-option instrument-parse-list :test #'string-equal)))))
  (with-page (:title "Resonance Output")
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
				(vibratsia::freq-float (second n))))))
    (:button (:a :href "/resonance.html" "Try Another Calculation" )))))

  (push
 (hunchentoot:create-prefix-dispatcher "/assess" #'resonance-calculator)
 hunchentoot:*dispatch-table*)


    (push
 (hunchentoot:create-prefix-dispatcher "/resonance.html" #'resonance-calculator)
 hunchentoot:*dispatch-table*)



;;;;organization:
;;;;resonance-prompt.lisp
;;;;resonance-output.lisp
