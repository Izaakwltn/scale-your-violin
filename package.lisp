;;;;package.lisp
;;;;
;;;;Copyright (c) 2021 Izaak Walton

(ql:quickload "hunchentoot")

(defpackage #:scale-your-violin
  (:documentation "scaleyourviolin.com")
  (:use #:cl #:parenscript #:spinneret #:hunchentoot #:vibratsia))
