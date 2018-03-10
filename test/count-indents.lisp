(load "./count-indents.lisp")

(it "counts no indentations (ha ha ha)"
    (lambda ()
      (count-indents "+ 1 2"))
    0)

(it "counts one indentation (ha ha ha)"
    (lambda ()
      (count-indents "  + 1 2"))
    1)

(it "counts two indentations  (ha ha ha)"
    (lambda ()
      (count-indents "    + 1 2"))
    2)
