#lang sicp

; ---------------------------------------------------------------

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; ------------------------- funciones -------------------------

; accumulate-n
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op 
                        init 
                        (map (lambda (x) 
                               (car x)) 
                             seqs))
            (accumulate-n op 
                          init 
                          (map (lambda (x)
                                 (cdr x))
                               seqs)))))

; ---------------------------- tests ----------------------------

(define seq (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(display seq)
(newline)
(display (accumulate-n + 0 seq))
; que da como resultado: (22 26 30)

; ---------------------------------------------------------------

