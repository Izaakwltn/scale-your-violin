;;;;resonance.lisp
;;;;Resonance Calculator

(in-package :scale-your-violin)


(defvar note-options (mapcar #'vibratsia::freq-to-note
			     (vibratsia::frequency-ladder 16.35 4185.6)))

(defvar instrument-options '(violin viola cello bass hardingfele))

(defvar root-options ())

(defvar quality-options
  '(major ionian dorian phrygian lydian mixolydian aeolian nat-min mel-min har-min locrian))

;;;;Maybe move to a different file
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
     (:form
      (:select :name "instrument-options"
        (loop for instrument in scale-your-violin::instrument-options
	      do (:option :value instrument (format nil "~a" instrument))))))
    (:section
     (:h2 "Scale Assessment")
     (:h3 "Returns a resonance profile for a specific scale/key on a particular instrument")
     (:p "Select the root, quality, and number of octaves for the scale, and the instrument.")
     (:form :id "scale-assessment"
      (:select :name "root" :form "scale-assessment"
	(:option "root of the problem"))
      (:select :name "quality" :form "scale-assessment"
	(loop for qual in scale-your-violin::quality-options
	      do (:option :value qual
			  (format nil "~a" qual))))
      (:select :name "Octaves" :form "scale-assessment"
	(loop for i from 1 to 7
	      do (:option :value i
			  (format nil "~a" i)))))
    (:section
     (:h2 "Note Assessment")
     (:h3 "Returns a resonance profile for a specified note on a specified instrument")
     (:p "Select a note and an instrument")
     (:form :id "note-instrument"
      (:select :name "note-options"
	(loop for note in scale-your-violin::note-options
	      do (:option :value note
			  (format nil "~a-~a" (first note) (second note)))))
      (:select :name "instrument-options"
	(loop for instrument in instrument-options
	      do (:option :value instrument (format nil "~a" instrument))))
     (:input :type "submit" :id "instrument and note" ))))))

(push
 (hunchentoot:create-prefix-dispatcher "/resonance.html" #'resonance-calculator)
 hunchentoot:*dispatch-table*)

