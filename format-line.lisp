(defun format-line (offset-count line close-parens)
  (format nil "~a(~a~a"
          (make-string (* 2 offset-count) :initial-element #\space)
          (string-trim '(#\space) line)
          (if close-parens
            (make-string close-parens :initial-element #\))
            "")))
