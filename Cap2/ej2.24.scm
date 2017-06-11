#lang planet neil/sicp


; al evaluar:

; (list 1 (list 2 (list 3 4)))

; se tendrá:

; (cons 1 (cons (cons 2 (cons (cons 3 (cons 4 nil)) nil)) nil))

; el interpretador deberia responder con:

; (list 1 (list 2 (3 4)))
; (list 1 (2 (3 4)))
; (1 (2 (3 4)))

; representacion como arbol:
;    *
;   / \
;  1  *
;    / \
;   * nil
;  / \
; 2   *
;    / \
;   * nil
;  / \
; 3   *
;    / \
;   4 nil

