#lang planet neil/sicp

; La evaluacion de orden normal desarrolla el arbol de expresiones en su totalidad hasta solo
; estar compuesto por operadores y argumentos primitivos, y luego evalua. Mientras que la evaluacion
; de orden aplicativo evalua operadores y argumentos a medida que se va desarrollando el arbol de 
; expresiones. De esta forma, en un interpretador de evaluacion de orden normal al tratar de reemplazar
; el segundo argumento (p), el interpretador entraria en un bucle infinito de reemplazos. Mientras que
; en un interpretador con evaluacion de orden aplicativo, apenas se evalue el primer argumento, 
; se retornaria un valor como resultado.

