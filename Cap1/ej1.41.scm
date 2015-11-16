#lang planet neil/sicp

; double
(define (double f)
  (lambda (x) (f (f x))))

; tests
(((double (double double)) inc) 5)
