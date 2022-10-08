#lang sicp

; square
(define (square x) (* x x))

; compose
(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6)