#lang sicp

; funcion continua finita iterativa
(define (cont-frac n d k)
  (define (sub-cont-frac n d k i acum)
    (cond ((= 1 i) (/ (n 1) (+ (d 1) acum)))
          (else (sub-cont-frac n d k (- i 1) (/ (n i) (+ (d i) acum))))))
  (sub-cont-frac n d k k (/ (n k) (d k))))


; aproximacion a la funcion tangente (en grados)
(define (tan-cf deg k)
  (let ((rad (* deg 0.0174533)))
    (cont-frac (lambda (u) (cond ((= u 1) rad)
                                 (else (* -1 (expt rad 2)))))
               (lambda (u) (- (* 2 u) 1))
               k)))


; tests
(tan-cf 30.0 1000)
(tan-cf 45.0 1000)
(tan-cf 60.0 1000)
(tan-cf 90.0 1000)
(tan-cf 120.0 1000)

