#lang sicp

; -------------------------------------------------------------

; fold-right
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

; -------------------------------------------------------------

; fold-left
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; -------------------------------------------------------------

; reverse en funcion de fold-right
(define (reverse sequence)
  (fold-right (lambda (x y) 
                (append y (list x))) 
              nil
              sequence))

; reverse en funcion de fold-left
(define (reverse2 sequence)
  (fold-left (lambda (x y)
               (cons y x)) 
             nil
             sequence))

; ---------------------------- tests ----------------------------

(define sec1 (list 1 2 3 4))

(display (reverse sec1))
(newline)
(display (reverse2 sec1))
(newline)

; ---------------------------------------------------------------

