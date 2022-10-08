#lang sicp

; ----------------------------------------------------------

; acumulador
(define (make-accumulator acc)
  (define (add val)
    (set! acc (+ acc val))
    acc)
  add)

; ----------------------- test -----------------------------

(define x (make-accumulator 10))
(display (x 10))
(newline)
(display (x 20))
(newline)
(display (x 15))
(newline)
(display (x 50))

; ----------------------------------------------------------