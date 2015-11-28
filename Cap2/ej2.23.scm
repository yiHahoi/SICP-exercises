#lang planet neil/sicp

; for-each
(define (for-each proc lst)
  (cond ((null? lst) #t)
        (else (proc (car lst))
              (for-each proc (cdr lst)))))

; tests
(for-each display (list 1 2 3 4 5))

