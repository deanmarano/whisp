(load "whisp.lisp")

(it "should pass"
    (lambda ()
      T
      ) T)

(it "should pass again"
    (lambda ()
      T
      ) T)

(it "prints hello world"
    (lambda ()
      (compile-whisp "print \"hello world\""))
    "(print \"hello world\")")

;(it "can add numbers"
    ;(lambda ()
      ;(eval-whisp "+ 1 2"))
    ;3)

(it "loads whisp from a file"
    (lambda ()
      (load-whisp "test/examples/one-plus-two.whisp"))
    3)

(it "can handle multiple statements"
    (lambda ()
      (compile-whisp "+ 1 2
+ 3 4"))
"(+ 1 2)
(+ 3 4)")

(it "works with indented statements"
    (lambda ()
      (compile-whisp
"+ 1
  + 2 3"))
"(+ 1
  (+ 2 3))")

(it "works with indented statements"
    (lambda ()
      (eval-whisp
"+ 1
  + 2 3"))
    6)

(it "works with more indented statements"
    (lambda ()
      (compile-whisp
"+ 1
  + 2 3
    + 4 5"))
"(+ 1
  (+ 2 3
    (+ 4 5)))")

(xit "if statements work"
    (lambda ()
      (compile-whisp
"if T
  + 1 2
  + 3 4"))
"(if T
  (+ 1 2)
  (+ 3 4))")

(it "counts no indentations (ha ha ha)"
    (lambda ()
      (indents "+ 1 2"))
    0)

(it "counts one indentation (ha ha ha)"
    (lambda ()
      (indents "  + 1 2"))
    1)

(it "counts two indentations  (ha ha ha)"
    (lambda ()
      (indents "    + 1 2"))
    2)
