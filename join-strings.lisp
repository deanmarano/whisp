(defun join-strings (strings &optional (join-with #\newline))
  (let ((all ""))
    (mapcar
         (lambda (c)
           (progn
             (setf all (concatenate 'string
                                    all
                                    (string c)
                                    (string join-with)))))
    strings)
    (string-trim '(#\newline) all)))
