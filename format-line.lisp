(defun format-line (offset-count line close-parens)
  (if (zerop (length line))
    ""
    (let ((trimmed-line (string-trim '(#\space) line)))
        (if (starts-with-data trimmed-line)
          (decf close-parens))
      (format nil "~a~a~a~a"
            (make-string (* 2 offset-count) :initial-element #\space)
            (if (starts-with-data trimmed-line) "" "(")
            trimmed-line
            (if close-parens
              (make-string close-parens :initial-element #\))
              "")))))

(defun starts-with-data (line)
  (or (numeric-string-p line)
      (is-data-p line)
      (is-string-p line)))

(defun is-data-p (line)
  (string= (subseq line 0 1) "'"))

(defun is-string-p (line)
  (string= (subseq line 0 1) "\""))

(defun numeric-string-p (string)
  ; protect against evil code
  (let ((*read-eval* nil))
    ; ignore-errors returns nil if there is an error
    (ignore-errors (numberp (read-from-string string)))))
