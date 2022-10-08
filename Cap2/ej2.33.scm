#lang sicp

; ---------------------------------------------------------------

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; ------------------------- funciones -------------------------

; map
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

; append
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

; length
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

; ---------------------------- tests ----------------------------

(define (square x) (* x x))
(define seq1 (list 1 2 3 4))
(define seq2 (list 5 6 7 8))

(display seq1)
(newline)
(display seq2)
(newline)
(display (map square seq1))
(newline)
(display (append seq1 seq2))
(newline)
(display (length seq1))
(newline)
; ---------------------------------------------------------------