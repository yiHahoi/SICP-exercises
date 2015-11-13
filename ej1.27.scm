#lang planet neil/sicp

; Fermat's Little Theorem: If n is a prime number and a is any positive integer less than n,
; then a raised to the nth power is congruent to a modulo n.

; (Two numbers are said to be congruent modulo n if they both have the same remainder when
; divided by n. The remainder of a number a when divided by n is also referred to as the
; remainder of a modulo n, or simply as a modulo n.)

; Numeros de Carmichael
; 561
; 1105
; 1729
; 2465
; 2821
; 6601


; son x e y congruentes modulo n?
(define (congruent? x y n)
  (= (remainder x n) (remainder y n)))

(define (carmichael n)
  (subCarmichael (- n 1) n))

(define (subCarmichael a n)
  (cond ((= a 1) (congruent? (expt a n) a n))
        ((congruent? (expt a n) a n) (subCarmichael (- a 1) n))
        (else #f)))

(carmichael 561)
(carmichael 1105)
(carmichael 1729)
(carmichael 2465)
(carmichael 2821)
(carmichael 6601)

