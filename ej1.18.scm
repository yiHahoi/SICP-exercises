#lang planet neil/sicp

; funciones base
(define (even? n)
  (= (remainder n 2) 0))
(define (square x) (* x x))
(define (halve x) (/ x 2))
(define (double x) (+ x x))

; solucion

(define (* a b)
  (mul a b 0))

(define (mul a b acum)
  (cond ((= b 1) (+ acum a))
        ((even? b) (mul (double a) (halve b) acum))
        (else (mul a (- b 1) (+ acum a)))))


; test
(* 35 100)
