#lang sicp


; que combinaciones de car y cdr devolverian el valor 7 de cada lista:

; PROBLEMA 1
(define x1 (list 1 3 (list 5 7) 9))
; el primer car se requiere para obtener el 7 de la lista (7)
(display (car (cdr (car (cdr (cdr x1))))))
(newline)

; PROBLEMA 2
(define x2 (list (list 7)))
(display (car (car x2)))
(newline)

; PROBLEMA 3
(define x3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
; a simple vista pareciera que la estructura es (cons 1 (cons 2 (cons 3 (cons .....))))
; pero la forma es mas compleja:
; (cons 1 (cons (cons 2 (cons (cons 3 (cons (cons 4 (cons (cons 5 (cons (cons 6 (cons 7 '())) '())) '())) '())) '())) '()))
; para obtener el 7 se debe hacer:
(display (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x3)))))))))))))
(newline)
