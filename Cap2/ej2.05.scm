#lang sicp

; ------------- representacion -------------

; cons
(define (cons a b)
  (define (cons2 a b acum)
    (cond ((> a 0) (cons2 (- a 1) b (* 2 acum)))
          ((> b 0) (cons2 a (- b 1) (* 3 acum)))
          (else acum)))
  (cons2 a b 1))

; desfragmentar
(define (desfragmentar x base acum)
  (cond ((= 0 (remainder x base))
         (desfragmentar (/ x base) 
                        base 
                        (+ acum 1)))
        (else acum)))

; car
(define (car x)
  (desfragmentar x 2 0))

; cdr
(define (cdr x)
  (desfragmentar x 3 0))

; ------------------ test ------------------

(display "a: 15")
(newline)
(display "b: 13")
(newline)
(define x (cons 15 13))
(display "x = (cons a b) = ")
(display x)
(newline)
(display "(car x) = ")
(car x)
(display "(cdr x) = ")
(cdr x)
