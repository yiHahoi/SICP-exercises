#lang planet neil/sicp

;calcula si n es un numero par
(define (even? n)
  (= (remainder n 2) 0))

; template multiplicador iterativo
(define (prod-iter fun next a b)
  (prod-subiter fun next a b 1))

(define (prod-subiter fun next a b acum)
  (if (> a b)
      acum
      (prod-subiter fun next (next a) b (* acum (fun a)))))

; factorial-iter
(define (fact-iter n)
  (define (identity x) x)
  (define (next x) (+ x 1))
  (prod-iter identity next 1 n))

; test factorial iterativo
(fact-iter 3)
(fact-iter 5)
(fact-iter 10)

;; aproximacion a pi iterativo
(define (pi-iter n) 
  (define (num x) (cond ((= x 1) 2) 
                        ((even? x) (+ x 2)) 
                        (else (num (- x 1)))))
  (define (den x) (cond ((= x 1) 3) 
                        ((even? x) (den (- x 1))) 
                        (else (+ x 2))))
  (define (fun x) (* 1.0 (/ (num x) (den x))))
  (define (next x) (+ x 1))
  (* 4 (prod-iter fun next 1 n)))

; test pi iterativo
(pi-iter 1)
(pi-iter 5)
(pi-iter 20)
(pi-iter 100)
(pi-iter 1000)
(pi-iter 10000)
(pi-iter 100000)
; de aqui en adelante a la version recursiva le toma segundos
(pi-iter 1000000)
