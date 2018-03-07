(defun split-lines (text)
  (let ((line "")
        (lines ()))
    (map nil
         (lambda (c)
           (if (eq c #\newline)
             (progn
               (setf lines (concatenate 'list lines (list line)))
               (setf line "")
               )
             (progn
               (setf line (concatenate 'string line (string c))))))
         text)
    (concatenate 'list lines (list line))))
