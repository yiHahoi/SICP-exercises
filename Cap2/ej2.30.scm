#lang sicp

; -----------------------------------------------------------

;x : tree
;si x : null -> nil 
;si x : no es tree -> (square x)
;si x : tree -> cons (sqr-tree (car x)) (sqr-tree (cdr x))

; -----------------------------------------------------------

; cuadrado de x
(define (square x) (* x x))

; -----------------------------------------------------------

; square 1
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))
 
; -----------------------------------------------------------

; square 2
(define (square-tree2 tree)
  (define (square-sub-tree sub-tree) 
    (cond ((pair? sub-tree) 
           (square-tree2 sub-tree))
          (else (square sub-tree))))
  (map square-sub-tree tree))

; -----------------------------------------------------------

; tests
(define example (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(display example)
(newline)
(display (square-tree example))
(newline)
(display (square-tree2 example))

; -----------------------------------------------------------