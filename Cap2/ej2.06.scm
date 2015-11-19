#lang planet neil/sicp

; ------------------ Numerales de Church ------------------

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; -------------------------- one --------------------------

; zero es un procedimiento que pide un argumento f y devuelve 
; otro procedimiento que pide un argumento x y devuelve x.
; tambien puede escribirse como:
; (define (zero f) (lambda (x) x))
; en este caso (zero f) devuelve un procedimiento identidad

; para add-1: 
; (add-1 zero)
; (lambda (f) (lambda (x) (f ((n f) x))))
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x)))
; (lambda (f) (lambda (x) (f x)))

; es decir, (add-1 zero) devuelve un procedimiento que pide 
; como argumento una funcion f, y esta devuelve otro procedimiento
; que pide un argumento x, y luego aplica esta funcion f al argumento x.
; de esta forma se puede representar 'one' como:

(define one (lambda (f) (lambda (x) (f x))))

; otra forma de definir one es
; (define (one f) (lambda (x) (f x))) 

; -------------------------- two --------------------------

; para obtener 'two', podemos descomponer (add-1 one)
; (add-1 one)
; (lambda (f) (lambda (x) (f ((n f) x))))
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))

; es decir, (add-1 one) devuelve un procedimiento que pide 
; como argumento una funcion f, y esta devuelve otro procedimiento
; que pide un argumento x, y luego aplica 2 veces esta funcion f al argumento x.
; de esta forma se puede representar 'two' como:

(define two (lambda (f) (lambda (x) (f (f x)))))

; otra forma de definir two es
; (define (two f) (lambda (x) (f (f x))))

; -------------------------- + --------------------------

; la idea es definir un procedimiento que permita representar lo siguiente:
; (define (three f) ((+ one two) f))
; (define (four f) ((+ one three) f))
; (define (five f) ((+ two three) f))
; para esto se puede modificar el procedimiento add-1
; (define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))
; dejandolo como:

(define (+ m n) (lambda (f) (lambda (x) ((m f) ((n f) x)))))

; ------------------------ test ------------------------

(define (three f) ((+ one two) f))
(define (four f) ((+ one three) f))
(define (five f) ((+ two three) f))

(define (mul n) (* n 3))

((one mul) 2)
((two mul) 2)
((three mul) 2)
((four mul) 2)
((five mul) 2)

