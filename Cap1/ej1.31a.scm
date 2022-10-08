#lang sicp

;calcula si n es un numero par
(define (even? n)
  (= (remainder n 2) 0))

; template multiplicador recursivo
(define (product fun next a b)
  (if (> a b)
      1
      (* (fun a)
         (product fun next (next a) b))))

;;; problema a)

; factorial
(define (factorial n)
  (define (identity x) x)
  (define (next x) (+ x 1))
  (product identity next 1 n))

; test factorial
(factorial 3)
(factorial 5)
(factorial 10)

; aproximacion a pi
(define (pi n) 
  (define (num x) (cond ((= x 1) 2)
                        ((even? x) (+ x 2))
                        (else (num (- x 1)))))
  (define (den x) (cond ((= x 1) 3)
                        ((even? x) (den (- x 1)))
                        (else (+ x 2))))
  (define (fun x) (* 1.0 (/ (num x) (den x))))
  (define (next x) (+ x 1))
  (* 4 (product fun next 1 n)))

; test pi recursivo
(pi 1)
(pi 5)
(pi 20)
(pi 100)
(pi 1000)




