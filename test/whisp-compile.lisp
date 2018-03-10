(load "whisp-compile.lisp")

(it "prints hello world"
    (lambda ()
      (whisp-compile "print \"hello world\""))
    "(print \"hello world\")")

(it "can handle multiple statements"
    (lambda ()
      (whisp-compile "+ 1 2
+ 3 4"))
"(+ 1 2)
(+ 3 4)")

(it "works with indented statements"
    (lambda ()
      (whisp-compile
"+ 1
  + 2 3"))
"(+ 1
  (+ 2 3))")

(it "works with more indented statements"
    (lambda ()
      (whisp-compile
"+ 1
  + 2 3
    + 4 5"))
"(+ 1
  (+ 2 3
    (+ 4 5)))")

(it "if statements work"
    (lambda ()
      (whisp-compile
"if T
  + 1 2
  + 3 4"))
"(if T
  (+ 1 2)
  (+ 3 4))")
