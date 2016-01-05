#lang planet neil/sicp

; -------------------------------------------------------------------

; derivada de exp con respecto a var
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (make-product (exponent exp)
                                     (make-exponentiation (base exp)
                                                          (list (- (exponent exp) 1))))
                       (deriv (base exp)
                              var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

; -------------------------------------------------------------------

; constructor expresion exponencial
(define (make-exponentiation base exp)
  (cond ((=number? base 0) 0)
        ((=number? base 1) 1)
        ((=number? exp 0) 1)
        ((=number? exp 1) base)
        (else (list '** base exp))))

; es una expresion exponencial?
(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))

; selector base de expresion exponencial
(define (base exp)
  (cadr exp))

; selector exponente de expresion exponencial
(define (exponent exp)
  (caddr exp))

; -------------------------------------------------------------------

; constructor expresion de suma
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

; es la expresion una suma?
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

; devuelve el primer termino de una expresion de suma
(define (addend s) (cadr s))

; devuelve la suma de todos los terminos menos el primero
(define (augend s)
  (if (null? (cdr (cdr (cdr s))))
      (caddr s)
      (cons '+ (cdr (cdr s)))))

; -------------------------------------------------------------------

; constructor expresion de multiplicacion
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

; es la expresion una multiplicacion?
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

; devuelve el primer termino de una expresionde multiplicacion
(define (multiplier p) (cadr p))

; devuelve la multiplicacion de todos los terminos menos el primero
(define (multiplicand p)
  (if (null? (cdr (cdr (cdr p))))
      (caddr p)
      (cons '* (cdr (cdr p)))))

; -------------------------------------------------------------------

; es la expresion un numero equivalente a num?
(define (=number? exp num)
  (and (number? exp) (= exp num)))

; es la expresion una variable?
(define (variable? x) (symbol? x))

; son la misma variable?
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; -------------------------------------------------------------------

; ejemplo
(deriv '(* x y (+ x 3)) 'x)

; -------------------------------------------------------------------