#lang planet neil/sicp

; par?
(define (even? x) 
  (= (remainder x 2) 0))

; devuelve argumentos de misma paridad que el primero
(define (same-parity x . y)
  (cons x (sub-same-parity y (even? x))))

(define (sub-same-parity lst even-parity)
  (cond ((null? lst) nil)
        (else (if (eq? (even? (car lst)) even-parity)
                  (cons (car lst) (sub-same-parity (cdr lst) even-parity))
                  (sub-same-parity (cdr lst) even-parity)))))


; test

(display (same-parity 1 2 3 4 5 6 7))
(newline)
(display (same-parity 2 3 4 5 6 7 8))