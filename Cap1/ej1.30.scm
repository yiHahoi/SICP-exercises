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

; template de sumatoria recursiva lineal
;(define (sum term a next b)
;  (if (> a b)
;      0
;      (+ (term a)
;         (sum term (next a) next b))))

; template de sumatoria iterativa
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))



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


; Tests!
(integral lineal 0.0 3.5 1000)
(integral square 0.0 2.7 500)
(integral cube 0.0 7.2 1000000)


