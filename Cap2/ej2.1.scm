#lang planet neil/sicp

; constructor
(define (make-rat n d) 
  (if (< d 0)
      (cond ((< n 0) (cons (abs n) (abs d)))
            (else (cons (* n -1) (abs d))))
      (cons n d)))

; selector numerador
(define (numer x) (car x))

; selector denominador
(define (denom x) (cdr x))

; suma numeros racionales
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y)) 
               (* (numer y) (denom x))) 
            (* (denom x) (denom y))))

; resta numeros racionales
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y)) 
               (* (numer y) (denom x))) 
            (* (denom x) 
               (denom y))))

; multiplica numeros racionales
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

; divide numeros racionales
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

; compara numeros racionales
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; imprime en pantalla un numero racional
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")(display (denom x)))


; tests
(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))
(define pos-pos (make-rat 1 3))
(define neg-neg (make-rat -1 -3))
(define neg-pos (make-rat -1 3))
(define pos-neg (make-rat 1 -3))

(print-rat one-half)

(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))

(print-rat pos-pos)

(print-rat neg-neg)

(print-rat neg-pos)

(print-rat pos-neg)
