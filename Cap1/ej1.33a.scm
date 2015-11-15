#lang planet neil/sicp

; calcula el cuadrado de x
(define (square x) (* x x))

; calcula si n es un numero primo
(define (prime? n)
  (= n (smallest-divisor n)))

; calcula el minimo divisor de n
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

;calcula si n es un numero par
(define (even? n)
  (= (remainder n 2) 0))

; template acumulador iterativo con filtro
(define (filtered-accumulate combiner null-value term filter a next b)
  (filtered-accumulate-iter combiner null-value term filter a next b null-value))

(define (filtered-accumulate-iter combiner null-value term filter a next b acum)
  (cond ((> a b) acum)
        (else (filtered-accumulate-iter combiner 
                                        null-value 
                                        term 
                                        filter
                                        (next a) 
                                        next 
                                        b
                                        (cond ((filter a) (combiner acum (term a)))
                                              (else acum))))))

; accumulate en terminos de filtered-accumulate
(define (accumulate combiner null-value term a next b)
  (define (all x) #t)
  (filtered-accumulate combiner null-value term all a next b))

; sumatoria iterativa
(define (sum term a next b)
  (accumulate + 0 term a next b))

; multiplicador iterativo
(define (product term next a b)
  (accumulate * 1 term a next b))

; suma de los cuadrados de los numeros primos en el rango [a,b]
(define (sum-of-square-of-primes a b)
  (define (next x) (+ x 1))
  (filtered-accumulate + 0 square prime? a next b))

;;TESTS

(sum-of-square-of-primes 1 5)  ; (1)^2+(2)^2+(3)^2+(5)^2 = 39
(sum-of-square-of-primes 1 10) ; (1)^2+(2)^2+(3)^2+(5)^2+(7)^2 = 88
(sum-of-square-of-primes 1 15) ; (1)^2+(2)^2+(3)^2+(5)^2+(7)^2+(11)^2+(13)^2 = 378
(sum-of-square-of-primes 1 20) ; (1)^2+(2)^2+(3)^2+(5)^2+(7)^2+(11)^2+(13)^2+(17)^2+(19)^2 = 1028




