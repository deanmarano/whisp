(load "whisp.lisp")

(it "can add numbers"
    (lambda ()
      (whisp-eval "+ 1 2"))
    3)

(it "loads whisp from a file"
    (lambda ()
      (whisp-load "test/examples/one-plus-two.whisp"))
    3)

(it "works with indented statements"
    (lambda ()
      (whisp-eval
"+ 1
  + 2 3"))
    6)


(it "compiles a factorial function"
    (lambda ()
      (whisp-read "test/examples/factorial.whisp"))
"(defun factorial (n)
  (if (< n 2)
    1
    (* n (factorial (- n 1)))))"
    )

(it "runs a factorial function"
    (lambda ()
      (whisp-load "test/examples/factorial.whisp")
      (factorial 5)
      )
    120)
