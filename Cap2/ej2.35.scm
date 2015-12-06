#lang planet neil/sicp

; ---------------------------------------------------------------

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; ------------------------- funciones -------------------------

; count-leaves en funcion de accumulate
; funciona pero no es para nada elegante, ya que map recibe un procedimiento identidad xd
; por lo que me imagino que existe una forma mas sensual de resolver este problema xD
(define (count-leaves tree)
  (accumulate (lambda (x y) 
                (cond ((not (pair? x)) (+ 1 y))
                      (else (+ (count-leaves x) y)))) 
              0 
              (map (lambda (x) x) tree)))

; ---------------------------- tests ----------------------------

(define tree (list 1 2 3 (list 4 5 6 (list 7 8)) (list (list 9 10) 11) 12 13))
(display tree)
(newline)
(count-leaves tree)
(newline)

; ---------------------------------------------------------------

(define (count-leaves tree)
  (accumulate (lambda (x y) 
                ()) 
              0 
              (map (lambda (x) 
                     ()) tree)))


