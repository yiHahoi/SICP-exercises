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

; dx
(define dx 0.0001)

; smooth
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

; n-smooth
(define (n-smooth f n)
  (repeated f n))