#lang planet neil/sicp


(display (car ''abracadabra))


; reemplazando se tiene que la expresion es equivalente a:
; (car (quote (quote abracadabra)))
; (car '(quote abracadabra))
; y se sabe que el quote de una lista es equivalente a
; la lista de los (elementos con...) quotes
; (car (list 'quote 'abracadabra))
; donde la expresion devuelve el primer elemento de la lista: quote

(newline)
(display (car (list 'quote 'abracadabra)))

