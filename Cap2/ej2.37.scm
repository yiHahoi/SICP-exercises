#lang sicp

; -------------------------------------------------------------

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; -------------------------------------------------------------

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

; ------------------------- funciones -------------------------

; producto punto de dos vectores
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; producto de matriz m con vector v
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

; matriz transpuesta (se cambian filas por columnas)
(define (transpose mat)
  (accumulate-n cons nil mat))

; producto de dos matrices
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
           (matrix-*-vector cols x)) 
         m)))



; ---------------------------- tests ----------------------------

(define vec1 (list 1 2))
(define vec2 (list 3 4))
(define mat1 (list vec1 vec2))

(display vec1) ; (1 2)
(newline)
(display vec2) ; (3 4)
(newline)
(display (dot-product vec1 vec2)) ; 11
(newline)
(display (matrix-*-vector mat1 vec1)) ; (5 11)
(newline)
(display mat1) ; ((1 2) (3 4))
(newline)
(display (transpose mat1)) ; ((1 3) (2 4))
(newline)
(display (matrix-*-matrix mat1 mat1)) ; ((7 10) (15 22))
(newline)

; ---------------------------------------------------------------

