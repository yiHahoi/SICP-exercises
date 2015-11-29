#lang planet neil/sicp


; al evaluar:

; (list 1 (list 2 (list 3 4)))

; el interpretador deberia responder con:

; (list 1 (list 2 (3 4)))
; (list 1 (2 (3 4)))
; (1 (2 (3 4)))

; representacion como cajas y punteros:
; ->|1|*|->|2|*|->|3|*|->|4|null|

; representacion como arbol:
;    *
;   / \
;  1   *
;     / \
;    2   *
;       / \
;      3   *
;         / \
;        4  null

