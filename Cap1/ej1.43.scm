#lang planet neil/sicp

; square
(define (square x) (* x x))

; compose
(define (compose f g)
  (lambda (x) (f (g x))))

; repeat n times
(define (repeated f n)
  (cond ((= n 1) f)
        (else (compose f (repeated f (- n 1))))))

; tests
((repeated square 2) 5)