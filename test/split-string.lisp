(load "./split-string.lisp")

(it "can split two lines into multiple lines"
    (lambda ()
      (split-string
"Hello
world"))
    '("Hello" "world"))

(it "can split two lines into multiple lines"
    (lambda ()
      (split-string
"Hello
new
world"))
    '("Hello" "new" "world"))
