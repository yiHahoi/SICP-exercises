#lang planet neil/sicp


; funcion continua finita iterativa
(define (cont-frac n d k)
  (define (sub-cont-frac n d k i acum)
    (cond ((= 1 i) (/ (n 1) (+ (d 1) acum)))
          (else (sub-cont-frac n d k (- i 1) (/ (n i) (+ (d i) acum))))))
  (sub-cont-frac n d k k (/ (n k) (d k))))


; golden-ratio
(define (golden-ratio k)
  (/ 1 (cont-frac (lambda (i) 1.0)
                  (lambda (i) 1.0)
                  k)))

; tests
(golden-ratio 12)
;se necesitan 12 pasos para aproximar a 4 decimales

