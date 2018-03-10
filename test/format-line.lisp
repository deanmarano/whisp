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

(it "returns nothing for empty lines"
  (lambda ()
    (format-line 0 "" 0))
  "")

(it "doesn't wrap with parens if line is a number"
  (lambda ()
    (format-line 0 "1" 1))
  "1")

(it "doesn't wrap with parens if line is a string"
  (lambda ()
    (format-line 0 "\"hello\"" 1))
  "\"hello\"")

(it "doesn't wrap with parens if line is data"
  (lambda ()
    (format-line 0 "'(1 2 3)" 1))
  "'(1 2 3)")

(it "knows a data line"
  (lambda ()
    (is-data-p "'(1 2 3)"))
  T)
