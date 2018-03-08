(load "./split-lines.lisp")

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

(defun indents (line &optional (number 0))
  (if (and (< 0 (length line)) (string= (subseq line 0 2) "  "))
    (indents (subseq line 2) (+ number 1))
    number))

(defun compile-whisp (whisp)
  (let ((lines (split-lines whisp))
        (previous-line "")
        (to-close 0)
        (index 0))
    (join
      (mapcar
        (lambda (line)
          (let ((offset-count (indents line))
                (offset (make-string (* 2 (indents line)) :initial-element #\space)))
            (if (< offset-count (indents (nth (1+ index) lines)))
              (progn
                (setf previous-line line)
                (incf index)
                (incf to-close)
                (format nil "~a(~a" offset (string-trim '(#\space) line)))
              (progn
                (setf previous-line line)
                (incf index)
                (decf offset-count)
                (format nil "~a(~a)~a"
                        offset
                        (string-trim '(#\space) line)
                        (make-string (1+ offset-count) :initial-element #\))
                        )))))
      lines))))

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
