#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))

(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp b (/ n 2))))
        (else (* b (fast-exp b (- n 1))))))

;;Solucion
(define (fast-exp-iter b n)
  (fast-exp-subiter b n 1))

(define (fast-exp-subiter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-exp-subiter (square b) (/ n 2) a))
        (else (fast-exp-subiter b (- n 1) (* a b)))))


;test
(fast-exp 3 20)
(fast-exp-iter 3 20)
(fast-exp 7 13)
(fast-exp-iter 7 13)