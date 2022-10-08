#lang sicp


(define x (list 1 2 3))
(define y (list 4 5 6))

; PROBLEMA 1
; append agregaba una lista al final de otra por lo que deberia ser equivalente a:
; (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 nil))))))
(append x y)
(newline)


; PROBLEMA 2
; cons de dos listas creara un arbol de dos ramas principales
; como arbol:
;
;        *
;       / \
;      /   \
;     /     \
;    /       \
;   *         *
;  / \       / \
; 1   *     4   *
;    / \       / \
;   2   *     5   *
;      / \       / \
;     3 null    6  null

; es decir deberia devolver:
; (cons (cons 1 (cons 2 (cons 3 nil))) (cons 4 (cons 5 (cons 6 nil))))

(cons x y)
(newline)


; PROBLEMA 3
; (cons (cons 1 (cons 2 (cons 3 nil))) (cons (cons 4 (cons 5 (cons 6 nil)))))
(list x y)
(newline)