#lang sicp

;(define (* a b)
;  (if (= b 0)
;      0
;      (+ a (* a (- b 1)))))


; se puede redefinir la funcion como 

(define (square x) (* x x))
(define (halve x) (/ x 2))
(define (double x) (+ x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (* a b)
  (cond ((= b 1) a)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))

;test
(* 20 33)