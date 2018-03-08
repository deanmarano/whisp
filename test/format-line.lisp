(load "./format-line.lisp")

(it "formats a line with no indents"
    (lambda ()
      (format-line 0 "+ 1 2" 1))
    "(+ 1 2)")

(it "formats a line with 1 indents"
    (lambda ()
      (format-line 1 "+ 1 2" 1))
    "  (+ 1 2)")

(it "formats a line with no close parens"
    (lambda ()
      (format-line 1 "+ 1 2" 0))
    "  (+ 1 2")

; if the next line is indented further
; leave it open

; if the next line is the same indent
; close that line but leave other lines open

; if the next line is empty, close out

; if the next line is indented less
; close out indents - to-close
