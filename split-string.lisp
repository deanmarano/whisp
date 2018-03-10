(defun split-string (text &optional (delimiter #\newline))
  (let ((line "")
        (lines ()))
    (map nil
         (lambda (c)
           (if (eq c delimiter)
             (progn
               (setf lines (concatenate 'list lines (list line)))
               (setf line "")
               )
             (progn
               (setf line (concatenate 'string line (string c))))))
         text)
    (concatenate 'list lines (list line))))
