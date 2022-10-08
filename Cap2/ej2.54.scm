#lang sicp

; compara si dos listas de simbolos son iguales
(define (equal? a b)
  (cond ((and (pair? a) 
              (pair? b))
         (and (equal? (car a) 
                      (car b))
              (equal? (cdr a) 
                      (cdr b))))
        ((eq? a b) #t)
        (else false)))


(equal? '(this is a list) '(this is a list))
; #t

(equal? '(this is a list) '(this (is a) list))
; #f

