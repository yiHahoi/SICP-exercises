#lang planet neil/sicp


; funcion continua finita recursiva
(define (cont-frac n d k)
  (define (sub-cont-frac n d k i)
    (cond ((= k i) (/ (n k) (d k)))
          (else (/ (n i) (+ (d i) (sub-cont-frac n d k (+ i 1)))))))
  (sub-cont-frac n d k 1))


; golden-ratio
(define (golden-ratio k)
  (/ 1 (cont-frac (lambda (i) 1.0)
                  (lambda (i) 1.0)
                  k)))

; tests
(golden-ratio 12)
;se necesitan 12 pasos para aproximar a 4 decimales

