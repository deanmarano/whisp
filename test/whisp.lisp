(load "whisp.lisp")

(it "should pass"
    (lambda ()
      T
      ) T)

(it "should pass again"
    (lambda ()
      T
      ) T)


;(it "can add numbers"
    ;(lambda ()
      ;(eval-whisp "+ 1 2"))
    ;3)

(it "loads whisp from a file"
    (lambda ()
      (load-whisp "test/examples/one-plus-two.whisp"))
    3)



(it "works with indented statements"
    (lambda ()
      (eval-whisp
"+ 1
  + 2 3"))
    6)


(it "compiles a factorial function"
    (lambda ()
      (read-whisp "test/examples/factorial.whisp"))
"(defun factorial (n)
  (if (< n 2)
    1
    (* n (factorial (- n 1)))))"
    )

(it "runs a factorial function"
    (lambda ()
      (load-whisp "test/examples/factorial.whisp")
      (factorial 5)
      )
    120)
