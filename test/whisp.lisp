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

;(it "can handle multiple statements"
    ;(lambda ()
      ;(compile-whisp "+ 1 2
               ;+ 3 4"))
;"(+ 1 2)
;(+ 3 4)")
