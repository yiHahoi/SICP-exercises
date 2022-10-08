#lang sicp

; devuelve el ultimo par de una lista
(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))


; test

(define example (list 1 2 3 4 5))
(display (last-pair example))
(newline)
(display (last-pair (list 23 72 149 34)))
