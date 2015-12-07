#lang planet neil/sicp

; -------------------------------------------------------------

; accumulate
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

; ------------------------- funciones -------------------------

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


; ---------------------------- tests ----------------------------

(display (fold-right / 1 (list 1 2 3)))
(newline)
(display (fold-left / 1 (list 1 2 3)))
(newline)
(display (fold-right list nil (list 1 2 3)))
(newline)
(display (fold-left list nil (list 1 2 3)))
(newline)
(display (fold-right + 0 (list 1 2 3)))
(newline)
(display (fold-left + 0 (list 1 2 3)))
(newline)

; ---------------------------------------------------------------

; el operador debe cumplir con la propiedad conmutativa, 
; es decir, que el orden con el que se aplique el operador a 
; los elementos de la secuencia no debe afectar al resultado final.
; por ejemplo los operadores de suma y multiplicación darán los mismos
; resultados para fold-left y fold-right. Mientras que los operadores
; de resta y división entregarán resultados diferentes.
