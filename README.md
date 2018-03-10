# WHISP

By Dean Marano

An experiment in whitespace-sensitive Common LISP

Final project for CSC458 at DePaul, written in Common Lisp.


## Usage:

### REPL

To run a (very rudimentary) REPL, run

* `./whisp`
* `./whisp repl`

Note: only single line statements work :(

#### Examples

`./whisp
> defun my-inc (x) (+ 1 x)

MY-INC
>my-inc 4

5
>`

or

`./whisp repl
> + 1 2

3
>`

### Compile

To compile a file, run

`./whisp c my-file.whisp > my-file.lisp`

or

`./whisp compile my-file.whisp > my-file.lisp`

### Test

To run all of the tests for whisp, you can run

`./whisp test`

To run a specific test file specify the path to the file.

(for example, format-line.lisp)
`./whisp test test/format-line.lisp`

### Help

Prints the README.md

* `./whisp -h`
* `./whisp --help`
* `./whisp help`

## Paper

More information can be found at:

https://docs.google.com/document/d/1Kud0C3w6BFjDss8Shvs34dDPNXCUIw_ZU_FB2F3qHVU
