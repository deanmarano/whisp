(load "count-indents.lisp")
(load "format-line.lisp")
(load "join-strings.lisp")
(load "split-string.lisp")

(defun whisp-compile (whisp)
  (let ((lines (split-string whisp))
        (to-close 0)
        (close-now 0)
        (index 0)) ; counter to access the next line
    (join-strings
      (mapcar
        (lambda (line)
          (setf close-now 0)
          (let ((offset-count (count-indents line))
                (next-line-offset (count-indents (nth (1+ index) lines))))
            ; if the next line is indented futher, track the close paren
            (if (< offset-count next-line-offset)
              (incf to-close))
            ; if the next line is indented the same, just close out the line
            (if (= offset-count next-line-offset)
              (incf close-now))
            ; if the next line is indented less, close some parens
            (if (> offset-count next-line-offset)
              (progn
                (loop for i from 0 to (- offset-count next-line-offset)
                      do (progn
                           (incf close-now)
                           (decf to-close)))))
            (incf index)
            (format-line offset-count line close-now)))
      lines))))
