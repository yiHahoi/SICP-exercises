#lang planet neil/sicp

; ------------------------ intervalo ------------------------

; constructor de intervalo
(define (make-interval a b) (cons a b))

; lower
(define (lower-bound x)
  (min (car x) (cdr x)))

; upper
(define (upper-bound x)
  (max (car x) (cdr x)))

; suma dos intervalos
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

; multiplica dos intervalos
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; divide dos intervalos
(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; resta dos intervalos
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

; -------------------------- suma --------------------------

; el width para la suma esta dado por:

; (/ (- (+ (upper-bound x) (upper-bound y)) 
;       (+ (lower-bound x) (lower-bound y))) 
;    2)

; lo que se puede reescribir como:

; (/ (+ (- (upper-bound x) (lower-bound x)) 
;       (- (upper-bound y) (lower-bound y))) 
;    2)

; lo que se puede reescribir como:

; (+ (/ (- (upper-bound x) (lower-bound x)) 2) 
;    (/ (- (upper-bound y) (lower-bound y)) 2)) 

; y es equivalente a:

; (+ (width x) 
;    (width y)) 

; -------------------------- resta --------------------------

; el width para la resta esta dado por:

; (/ (- (- (lower-bound x) (upper-bound y))
;       (- (upper-bound x) (lower-bound y)))
;    2)

; lo que se puede reescribir como:

; (/ (+ (- (lower-bound x) (upper-bound x))
;       (- (lower-bound y) (upper-bound y)))
;    2)

; lo que se puede reescribir como:

; (+ (/ (- (lower-bound x) (upper-bound x)) 2)
;    (/ (- (lower-bound y) (upper-bound y)) 2))

; como width es una magnitud y es igual en ambas direcciones 
; desde el centro del intervalo, se puede dejar lo anterior como:

; (+ (/ (- (upper-bound x) (lower-bound x)) 2)
;    (/ (- (upper-bound y) (lower-bound y)) 2))

; y es equivalente a:

; (+ (width x) 
;    (width y)) 

; -------------------------- mul --------------------------

; -------------------------- div --------------------------





