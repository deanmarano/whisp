(defun count-indents (line &optional (number 0))
  (if (and (< 1 (length line)) (string= (subseq line 0 2) "  "))
    (count-indents (subseq line 2) (+ number 1))
    number))
