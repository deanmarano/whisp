; From http://sodaware.sdf.org/notes/cl-read-file-into-string/
(defun read-file (filename)
  (with-open-file (stream filename)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))
