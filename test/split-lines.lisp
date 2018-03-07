(load "./split-lines.lisp")

(it "can split two lines into multiple lines"
    (lambda ()
      (split-lines
"Hello
world"))
    '("Hello" "world"))

(it "can split two lines into multiple lines"
    (lambda ()
      (split-lines
"Hello
new
world"))
    '("Hello" "new" "world"))
