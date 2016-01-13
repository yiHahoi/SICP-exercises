#lang planet neil/sicp


#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

Evalua en x el polinomio descrito por la lista de parametros p
donde el polinomio de la forma p = p[0]*x^n + p[1]*x^(n-1) + ... + p[n-1]*x + p[n]
se encuentra representado como la lista p = (p[0] p[1] ... p[n-1] p[n])

Solo por diversión (xd!) ...
Se evalúa el polinomio de forma recursiva en función de rectas. Por ejemplo: 

el polinomio:

y = a*x^3 + b*x^2 + c*x + d 

es equivalente al polinomio:

z = (((a*x + b)*x + c)*x + d)

donde la recta: 

u = (a*x + b) 

corresponde a la pendiente de la recta:

v = (u*x + c)

la que corresponde a la pendiente de la recta:

z = (v*x + d)

||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#


(define (eval-poly p x)
  
  ; evalua en x la recta definida como y=a*x+b
  (define (eval-line a b)
    (+ (* a x) b))
  ; evalua en x el polinomio descrito por p en forma iterativa
  (define (eval-poly-iter p acc)
    (cond ((null? p) acc)
          ((null? (cdr p)) (eval-line acc (car p)))
          (else (eval-poly-iter (cdr p) (eval-line acc (car p))))))

  ; invoca a eval-poly-iter
  (cond ((null? p) (error "p => '()"))
        (else (eval-poly-iter (cdr p) (car p)))))



; -------------------------------- test --------------------------------


(define poly1 (list 2.0 0.0 1.5))
(define poly2 (list 2.0 1.0 1.0 1.0))

(display (eval-poly poly1 3.14)) ; = 21.2192
(newline)
(display (eval-poly poly2 2.00)) ; = 23.0000



