;;;;scale-your-violin.asd
;;;;
;;;;Copyright (c) 2021 Izaak Walton

(asdf:defsystem #:scale-your-violin
  :version "0.0.1"
  :author "Izaak Walton <izaakw@protonmail.com>"
  :license "GNU General Purpose License"
  :description "scaleyourviolin.com"
  :depends-on (#:parenscript #:spinneret #:hunchentoot #:vibratsia #:parse-float)
  :serial t
  :components ((:file "package")
	       (:file "build-that-site")
	       (:file "scale-your-page")
	       (:module "www"
		:serial t
		:components ((:file "resonance")
			     (:file "resonance-output")))))
