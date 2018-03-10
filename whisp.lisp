; From http://sodaware.sdf.org/notes/cl-read-file-into-string/
(defun file-get-contents (filename)
  (with-open-file (stream filename)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))

(defun eval-whisp (whisp)
  (eval (read-from-string (compile-whisp whisp))))

(defun read-whisp (filename)
  (compile-whisp (file-get-contents filename)))

(defun load-whisp (filename)
  (eval (read-from-string (read-whisp filename))))
