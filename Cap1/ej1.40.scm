#lang planet neil/sicp

; tolerancia de error
(define tolerance 0.00001)

; dx
(define dx 0.00001)

; cuadrado de x
(define (square x) (* x x))

; fixed-point
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; derivada
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

; newton-transform
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

; newton-method
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


; cubic
(define (cubic a b c)
  (lambda (x) (+ (expt x 3) (* a (expt x 2)) (* b x) c)))


; tests ( x^3 + ax^2 + bx + c )
(newtons-method (cubic 1 1 1) 1)


