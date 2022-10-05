#lang sicp

; La evaluacion de orden normal expande/desarrolla el arbol de expresiones en su totalidad hasta solo
; estar compuesto por unidades basicas, y luego evalua los operandos/operadores a medida
; que sean necesarios. Mientras que la evaluacion de orden aplicativo evalua operadores y argumentos
; primero, al mismo tiempo que se va desarrollando el arbol de expresiones. De esta forma, en un interpretador
; de evaluacion de orden aplicativo al tratar de reemplazar el segundo argumento (p) al inicio,
; el interpretador entrara en un bucle infinito de reemplazos. Mientras que en un interpretador
; con evaluacion de orden normal, primero se desarrollara el arbol de expresiones completo, y solo al final
; se evaluara la expresion, y como x = 0, nunca se necesitara evaluar la expresion (p), por lo que el
; programa terminara sin problemas.

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

;(test 0 (p))