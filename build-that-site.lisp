;;;;build-that-site.lisp

(in-package :scale-your-violin)

(defvar *server* (make-instance 'hunchentoot:easy-acceptor :port 4242
 :document-root #p"/home/izaakwalton/programming/lisp-projects/scale-your-violin/www/"))
(hunchentoot::start *server*)
					;http://127.0.0.1:4242/

;(push
; (hunchentoot:create-prefix-dispatcher "/index.html" #'matrix-page)
; hunchentoot:*dispatch-table*)
