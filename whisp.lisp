(load "read-file.lisp")
(load "whisp-compile.lisp")

(defun whisp-eval (whisp)
  (eval (read-from-string (whisp-compile whisp))))

(defun whisp-read (filename)
  (whisp-compile (read-file filename)))

(defun whisp-load (filename)
  (eval (read-from-string (whisp-read filename))))

(defun whisp-repl ()
  (loop (progn
          (fresh-line)
          (princ "> ")
          (print (whisp-eval (read-line))))))
