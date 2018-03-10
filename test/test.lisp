(defvar *tests* (list))

; make getting values from an alist more obvious for me
(defun value-for-key (obj key)
  (cdr (assoc key obj)))

(defun run-test (test)
  (let ((desired (value-for-key test 'desired))
        (test-name (value-for-key test 'test-name))
        (actual (handler-case (funcall (value-for-key test 'body)) (error (e) e))))
    (if (equal actual desired)
      (progn
        (princ ".")
        `((test-name . ,test-name) (result . 1) (actual . ,actual) (desired . ,desired)))
      (progn
        (princ "X")
        `((test-name . ,test-name) (result . 0) (actual . ,actual) (desired . ,desired))))))

(defun run-tests ()
  (princ (format nil "Running ~a tests...~%~%" (length *tests*)))
  (let ((results (mapcar (lambda (test) (run-test test)) *tests*)))
    (let ((failed (remove-if
                    (lambda (result) (eq (value-for-key result 'result) 1))
                    results)))
      (princ (format nil "~%~%Summary~%-------~%"))
      (princ (format nil "Passed: ~a~%" (- (length *tests*) (length failed))))
      (princ (format nil "Failed: ~a~%" (length failed)))
      (when failed
        (princ (format nil "~%~%Failures:~%"))
        (mapcar
          (lambda (failure)
            (princ
              (format nil "it \"~a\"   ~%Desired: ~a   ~%Actual: ~a~%"
                      (value-for-key failure 'test-name)
                      (value-for-key failure 'desired)
                      (value-for-key failure 'actual))))
          failed)))))

; we want to collect all of the tests before we run them.
(defun it (test-name body desired)
  (setq *tests*
        (append *tests*
                (list `((test-name . ,test-name) (body . ,body) (desired . ,desired))))))

; easy way to comment out tests
(defun xit (_ _ _) (declare (ignore _)))

