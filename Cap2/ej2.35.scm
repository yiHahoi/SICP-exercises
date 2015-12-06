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
; map reemplaza elementos del arbol por 1's. 
; si hay subarboles, se les aplica count-leaves de forma recursiva.
(define (count-leaves tree)
  (accumulate +
              0
              (map (lambda (x) 
                     (cond ((not (pair? x)) 1)
                           (else (count-leaves x)))) 
                   tree)))


; otra forma de implementar count-leaves en funcion de accumulate
; funciona pero no es para nada elegante, ya que map recibe un procedimiento identidad xd
; por lo que no se aprovecha su uso.
(define (count-leaves2 tree)
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
(count-leaves2 tree)
(newline)

; ---------------------------------------------------------------

