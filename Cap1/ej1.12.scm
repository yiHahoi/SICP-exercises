#lang sicp

;; Triangulo de Pascal
(define (pascal row col)
  (cond ((or (= col 1) (= col row)) 1)
        (else (+ (pascal (- row 1) (- col 1) ) (pascal (- row 1) col ) ))))

; test
(pascal 4 3)
(pascal 4 4)
(pascal 5 4)
