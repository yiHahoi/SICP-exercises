#lang sicp

; y = x
(define (lineal x) x)

; cuadrado de x
(define (square x) (* x x))

; cubo de x
(define (cube x) (* x x x))

;calcula si n es un numero par
(define (even? n)
  (= (remainder n 2) 0))


; template acumulador iterativo
(define (accumulate combiner null-value term a next b)
  (accumulate-iter combiner null-value term a next b null-value))

(define (accumulate-iter combiner null-value term a next b acum)
  (if (> a b)
      acum
      (accumulate-iter combiner 
                       null-value 
                       term 
                       (next a) 
                       next 
                       b
                       (combiner acum (term a)))))

; sumatoria iterativa
(define (sum term a next b)
  (accumulate + 0 term a next b))

; multiplicador iterativo
(define (product term next a b)
  (accumulate * 1 term a next b))

; integral por regla de simpson
(define (integral fun a b n)

  (define dx (/ (- b a) n))
  (define (next x) (+ x 1))
  (define (simp x)
    (cond ((even? x) (* 2 (fun (* x dx))))
          (else (* 4 (fun (* x dx))))))

  (* (/ dx 3)
     (+ (fun a) 
        (fun b) 
        (sum simp 
             (+ 0 1)
             next 
             (- n 1)))))

; factorial
(define (factorial n)
  (define (identity x) x)
  (define (next x) (+ x 1))
  (product identity next 1 n))

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


;;;TESTS!

; test integrales iterativas
(integral lineal 0.0 3.5 1000)
(integral square 0.0 2.7 500)
(integral cube 0.0 7.2 1000000)

; test factorial iterativo
(factorial 3)
(factorial 5)
(factorial 10)

; test pi iterativo
(pi 1)
(pi 5)
(pi 20)
(pi 100)
(pi 1000)
(pi 10000)
(pi 100000)
(pi 1000000)

