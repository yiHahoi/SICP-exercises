#lang planet neil/sicp

; -----------------------------------------------------------

;x : tree
;si x : null -> nil 
;si x : no es tree -> (proc x)
;si x : tree -> cons (tree-map (car x)) (tree-map (cdr x))

; -----------------------------------------------------------

; cuadrado de x
(define (square x) (* x x))

; -----------------------------------------------------------

; tree-map
(define (tree-map proc tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))
 
; -----------------------------------------------------------

(define (square-tree tree) (tree-map square tree))

; -----------------------------------------------------------

; tests
(define example (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display example)
(newline)
(display (square-tree example))

; -----------------------------------------------------------