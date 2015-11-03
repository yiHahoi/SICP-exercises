#lang planet neil/sicp

(define (A x y)
  (cond ((= y 0) 0)
         ((= x 0) (* 2 y))
          ((= y 1) 2)
           (else (A (- x 1)
                    (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

;;; SOLUCION

; (define (f n) (A 0 n)) 
; al correr (f n) se aplicara (A 0 n), donde x=0, por lo que siempre entrará al condicional ((= x 0) (* 2 y))
; por lo tanto (A 0 n) se puede simplificar como la expresion: (* 2 n)
; (f n) = {2*n}

; (define (g n) (A 1 n))
; al correr (g n) se aplicara (A 1 n), por lo que se entrará al else. De esta forma se puede simplificar la expresion como:
; (g n) = (A (- 1 1) (A 1 (- n 1))) = (A 0 (A 1 (- n 1))). Para "y" distinto de 0 o 1 se tendra:
; (g n) = (A 0 (A 1 (- n 1))) = (A 0 (A 0 (A 1 (- n 2)))). Se puede notar un patron en el termino interno, dando como resultado:
; (g n) = (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 ...... (A 1 (- n (- n 1)))...)))).. el que se puede simplificar como:
; (g n) = (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 ...... (A 1 1) ... ))))))))..
; (g n) = (* 2 (* 2 (* 2 (* 2 (* 2 ( ... (2) ... )))))
; (g n) = {2^n}

; (define (h n) (A 2 n))
; se puede ver que para un valor de n distino de 1 o 0, en la primera iteracion se entrará a la condicion de else:
; (h n) = (A 2 n) = (A (- 2 1) (A 2 (- n 1))) = (A 1 (A 2 (- n 1))) , utilizando el resultado del ejercicio anterior:
; (h n) = (g (A 2 (- n 1))) donde (A 2 (- n 1)) = (h (- n 1)) es decir, es recursivo, resultando equivalente a:
; (h n) = (g (h (- n 1))) por lo tanto (h n) = (g (h (- n 1))) = (g (g (h (- n 2)))) = (g (g (g (h (- n 3)))) = ...
; ... = (g (g (g (h (- n 3)))) Asi se puede apreciar un patron y como se sabe que (g n) = {2^n} podemos representar la expresion como:
; (g (g (g (h (- n 3)))) = 2^(2^(2^((h (- n 3))))) la que sigue creciendo hasta que la expresion interna queda como (h 1) = 2 lo que da como resultado:
; (g (g (g ... (g (h 1)) ... ))) = (2^ (2^ (2^ ... (2^ (2)) ... )))
; Asi se llega a que (h n) = (2^ (2^ (2^ ... (2^ (2)) ... ))) donde n corresponde al total de exponenciales. Se puede reimplementar la funcion como:

(define (pow b e) (cond ((= e 1) b)
                        (else (* b (pow b (- e 1))))))
(define (h n) (cond ((= n 0) 1)
                    (else (pow 2 (h (- n 1))))))

;; Test
(h 0)
(h 1)
(h 2)
(h 3)
(h 4)


