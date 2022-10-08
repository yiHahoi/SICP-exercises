#lang sicp

; ---------------------------------------------------------------

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; ------------------------- funciones -------------------------

; Evaluacion de polinomio por Regla de Horner
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
                (+ this-coeff
                   (* x higher-terms)))
              0
              coefficient-sequence))

; ---------------------------- tests ----------------------------

; polinomio (1 + 3x + 5x^3 + x^5)
; al evaluar para x = 2, se obtiene 79.

(horner-eval 2 (list 1 3 0 5 0 1))

; ---------------------------------------------------------------