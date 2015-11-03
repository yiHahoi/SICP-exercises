#lang planet neil/sicp

;improve
(define (improve guess x)
  (average guess (/ x guess)))


;sqrt-iter
(define (sqrt-iter prevGuess guess x)
  (if (good-enough? prevGuess guess x)
      guess
      (sqrt-iter guess (improve guess x) x)))

;good-enough?
(define (good-enough? prevGuess guess x)
  (< (abs (- prevGuess guess)) (* 0.1 guess)))


;average
(define (average x y)
  (/ (+ x y) 2))

;sqrt
(define (sqrt x)
  (sqrt-iter x 1.0 x)) 
;; no estoy seguro de q valor darle a prevGuess inicial xD

