#lang sicp

(define (square x) (* x x))

(define (f g)
  (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

; solucion: 
; al llamar a (f f) ocurre un error.
; se esperaba que entrara en un loop infinito pero para que esto ocurriese
; la definicion de la funcion tendria que haber sido algo como:
;
; (define (f g)
;    (f f))
;
; en vez de esto, lo que ocurre es que al llamarse (f f) el interpretador
; espera que el argumento de la funcion f corresponda a un procedimiento
; g que pida un argumento numerico. En vez de esto se le esta entregando
; como argumento un procedimiento que pide un procedimiento como argumento.
