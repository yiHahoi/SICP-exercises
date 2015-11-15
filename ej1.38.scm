#lang planet neil/sicp

; si se realiza un corrimiento de la secuencia agregando un elemento
; al inicio, se puede obtener el valor del denominador revisando si
; el indice es multiplo de 3.
; es decir, escribiendo:
; 1 2 1 1 4 1 1 6 1 1 8
; como:
; 1 1 2 1 1 4 1 1 6 1 1 8

; funcion continua finita iterativa
(define (cont-frac n d k)
  (define (sub-cont-frac n d k i acum)
    (cond ((= 1 i) (/ (n 1) (+ (d 1) acum)))
          (else (sub-cont-frac n d k (- i 1) (/ (n i) (+ (d i) acum))))))
  (sub-cont-frac n d k k (/ (n k) (d k))))

; calcula si el indice x es multiplo de 3
(define (triven? i)
  (= (remainder i 3) 0))

; calcula una aproximacion a la constante e.
(define (e-const k)
  (define (den k)
    (cond ((not (triven? (+ k 1))) 1)
          (else (* 2 (/ (+ k 1) 3)))))
  (+ 2.0 (cont-frac (lambda (x) 1) den k)))

; tests
(e-const 1)
(e-const 5)
(e-const 10)
(e-const 25)
(e-const 50)
(e-const 100)


