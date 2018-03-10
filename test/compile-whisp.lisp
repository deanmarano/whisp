(load "compile-whisp.lisp")

(it "prints hello world"
    (lambda ()
      (compile-whisp "print \"hello world\""))
    "(print \"hello world\")")

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

(it "works with more indented statements"
    (lambda ()
      (compile-whisp
"+ 1
  + 2 3
    + 4 5"))
"(+ 1
  (+ 2 3
    (+ 4 5)))")

(it "if statements work"
    (lambda ()
      (compile-whisp
"if T
  + 1 2
  + 3 4"))
"(if T
  (+ 1 2)
  (+ 3 4))")
