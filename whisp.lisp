(defun join (strings)
  (let ((all ""))
    (mapcar
         (lambda (c)
           (progn
             (setf all (concatenate 'string
                                    all
                                    (string c)
                                    (string #\newline)))))
    strings)
    (string-trim '(#\newline) all)))

(defun compile-whisp (whisp)
  (let ((lines (split-lines whisp)))
    (join (mapcar (lambda (line)
                   (format nil "(~a)" line)) lines))))

(defun eval-whisp (whisp)
  (eval (read-from-string (compile-whisp whisp))))

; From http://sodaware.sdf.org/notes/cl-read-file-into-string/
(defun file-get-contents (filename)
  (with-open-file (stream filename)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))


(defun load-whisp (filename)
  (let ((input (file-get-contents filename)))
    (eval-whisp input)))
