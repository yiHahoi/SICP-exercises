#lang sicp

; devuelve una lista invertida
(define (reverse lst)
  (sub-reverse lst (length lst)))

(define (sub-reverse lst size)
  (if (= size 0)
      nil
      (cons (list-ref lst (- size 1))
            (sub-reverse lst (- size 1)))))

; test

(define example (list 0 1 2 3 4 5 6 7 8 9))
(display (reverse example))
