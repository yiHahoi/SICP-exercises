#lang sicp

; funcion fringe
(define (fringe lst)
  (cond ((null? lst) nil) 
        ((pair? (car lst)) (append (fringe (car lst)) 
                                   (fringe (cdr lst))))
        (else (append (list (car lst)) 
                      (fringe (cdr lst))))))


; tests
(define x (list (list 1 2) (list 3 4)))
(display (fringe x))
(newline)
(display (fringe (list x x)))
