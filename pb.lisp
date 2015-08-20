;;;; pb.lisp

(in-package #:pb)

(defparameter *width* 10)

(defun pb (count total)
  (format t "~D / ~D [" count total)
  (let* ((n (floor (/ (* *width* count) total)))
        (blanks (- *width* n)))
    (loop repeat n do
      (write-string "="))
    (loop repeat blanks do
      (write-string " ")))
  (format t "]~C" #\return)
  (finish-output nil)
  nil)

