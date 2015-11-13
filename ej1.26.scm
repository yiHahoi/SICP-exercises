#lang planet neil/sicp


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;claramente se esta llamando a la funcion expmod un mayor numero de veces, siendo innecesario.
;esto afecta directamente al rendimiento del programa.