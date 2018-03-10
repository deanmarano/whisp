# Micro Test Lib

I keep this in a `./test/` folder. I run it like this:

```
clisp test/test.lisp
```

If I want to run it against a specific test file, I use

```
clisp test/test.lisp test/format-line.lisp
```

The output looks like this:
```
$ clisp test/test.lisp
Running 24 tests...

........................

Summary
-------
Passed: 24
Failed: 0

```

A test is written like this:

test/format-line.lisp
```
(load "./format-line.lisp")

(it "formats a line with no indents"
    (lambda ()
      (format-line 0 "+ 1 2" 1))
    "(+ 1 2)")
```

That specific test would be run:
```
clisp test/test.lisp test/format-line.lisp
```

If it was not passing, it would show an error:

```
$ clisp test/test.lisp test/format-line.lisp
Running 8 tests...

X.......

Summary
-------
Passed: 7
Failed: 1


Failures:
it "formats a line with no indents"
Desired: (+ 1 2
Actual: (+ 1 2)
```

After fixing the error:

```
$ clisp test/test.lisp test/format-line.lisp
Running 8 tests...

........

Summary
-------
Passed: 8
Failed: 0
```
