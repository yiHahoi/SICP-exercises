#lang planet neil/sicp

;;Exercise 1.3. Define a procedure that takes three numbers as arguments and returns the sum of the
;;squares of the two larger numbers.

;Square
(define (square x) (* x x))

;Sum of Squares
(define (sumOfSquares x y) (+ (square x) (square y)))

;Function
(define (function x y z) (cond ((and (< x y) (< x z)) (sumOfSquares y z)) ;si el menor es x.
                               ((and (< y x) (< y z)) (sumOfSquares x z)) ;si el menor es y.
                               (else (sumOfSquares x y))))                ;si el menor es z o x=y=z.

; se prueba el codigo
(function 1 2 3)  ;resultado esperado 13
(function 5 10 2) ;resultado esperado 125
(function 3 3 3)  ;resultado esperado 18

