#lang planet neil/sicp


;good-enough?
(define (good-enough? guess x)
  (< (abs (- (* guess guess guess) x)) 0.001))

;improve
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

;cubicRoot-iter
(define (cubicRoot-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubicRoot-iter (improve guess x) x)))

;cubicRoot
(define (cubicRoot x)
  (cubicRoot-iter 1.0 x))