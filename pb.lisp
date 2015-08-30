;;;; pb.lisp

(in-package #:pb)

(defclass progress-bar ()
  ((count
    :initarg :count
    :initform 1
    :reader pb-count)
   (total
    :initarg :total
    :initform (error "Must inform a total value")
    :reader pb-total)
   (width
    :initarg :width
    :initform 10
    :reader width)))

(defmethod pb-inc ((pb progress-bar))
  (format t "~D / ~D [" (pb-count pb) (pb-total pb))
  (let* ((n (floor (/ (* (width pb) (pb-count pb)) (pb-total pb))))
         (blanks (- (width pb) n)))
    (loop repeat n do
         (write-string "="))
    (loop repeat blanks do
         (write-string " ")))
  (format t "]~C" #\return)
  (finish-output nil)
  (incf (slot-value pb 'count)))

(defmethod pb-finish ((pb progress-bar))
  (format t "Finished~%"))
