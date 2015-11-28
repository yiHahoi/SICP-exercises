#lang planet neil/sicp

; square 1
(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) 
               (car items)) 
            (square-list (cdr items)))))

; square 2
(define (square-list2 items)
  (map (lambda (x) (* x x)) items))

; tests
(define example (list 1 2 3 4 5))
(display (square-list example))
(newline)
(display (square-list2 example))

