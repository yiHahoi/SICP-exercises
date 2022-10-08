#lang sicp


; -------------------------------- INFO --------------------------------


;  Evalua en x el polinomio descrito por la lista de parametros p
;  donde el polinomio de la forma p = p[0]*x^n + p[1]*x^(n-1) + ... + p[n-1]*x + p[n]
;  se encuentra representado como la lista p = (p[0] p[1] ... p[n-1] p[n])
;
;  Solo por diversión (xd!) ...
;  Se evalúa el polinomio de forma recursiva en función de rectas. Por ejemplo: 
;
;  el polinomio:
;
;  y = a*x^3 + b*x^2 + c*x + d 
;
;  es equivalente al polinomio:
;
;  z = (((a*x + b)*x + c)*x + d)
;
;  donde la recta: 
;
;  u = (a*x + b) 
;
;  corresponde a la pendiente de la recta:
;
;  v = (u*x + c)
;
;  la que corresponde a la pendiente de la recta:
;
;  z = (v*x + d)


; -------------------------------- POLY --------------------------------

; evalua en x la recta definida como y=m*x+k
(define (eval-line m k x)
  (+ (* m x) k))

; evalua en x el polinomio descrito por param en forma iterativa
(define (eval-poly param x)
  ; iterador
  (define (eval-poly-iter acc param)
    (cond ((null? param) acc)
          (else (eval-poly-iter (eval-line acc (car param) x) 
                                (cdr param)))))
  ; invoca a eval-poly-iter
  (cond ((null? param) (error "lista param debe poseer al menos un parametro"))
        (else (eval-poly-iter 0 param))))


; -------------------------------- TEST --------------------------------


(define poly1 (list 2.0 0.0 1.5))
(define poly2 (list 2.0 1.0 1.0 1.0))
(define poly3 (list 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0))

(display (eval-poly poly1 3.14)) ; = 21.2192
(newline)
(display (eval-poly poly2 2.00)) ; = 23.0000
(newline)
(display (eval-poly poly3 5.00)) ; = 488280.0


; ----------------------------------------------------------------------


