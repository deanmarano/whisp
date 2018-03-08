(load "./split-lines.lisp")
(load "./format-line.lisp")

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
        (to-close 0)
        (close-now 0)
        (index 0))
    (join
      (mapcar
        (lambda (line)
          (setf close-now 0)
          (let ((offset-count (indents line))
                (next-line-offset (indents (nth (1+ index) lines))))
            (if (< offset-count next-line-offset)
              (setf to-close (1+ to-close)))
            (if (= offset-count next-line-offset)
              (incf close-now))
            (if (> offset-count next-line-offset)
              (progn
                (loop for i from 0 to (- offset-count next-line-offset)
                      do (progn
                           (incf close-now)
                           (decf to-close)))))
            (incf index)
            (format-line offset-count line close-now)))
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
