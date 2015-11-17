#lang planet neil/sicp

;--------------------------- PUNTO ---------------------------

; devuelve un punto en funcion de las coordenadas x e y
(define (make-point x y)
  (cons x y))

; devuelve la coordenada x del punto
(define (x-point x)
  (car x))

; devuelve la coordenada y del punto
(define (y-point x)
  (cdr x))

; imprime las coordenadas de un punto p
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;-------------------------- SEGMENTO --------------------------

; recibe dos puntos y devuelve un segmento
(define (make-segment point1 point2)
  (cons point1 point2))

; devuelve el punto de inicio del segmento x
(define (start-segment x)
  (car x))

; devuelve el punto de termino del segmento x
(define (end-segment x)
  (cdr x))

; recibe un segmento y devuelve el punto medio
(define (midpoint-segment x)
  (let ((x1 (x-point (start-segment x)))
        (y1 (y-point (start-segment x)))
        (x2 (x-point (end-segment x)))
        (y2 (y-point (end-segment x))))
    (make-point (/ (+ x1 x2) 2)
                (/ (+ y1 y2) 2))))

;---------------------------- TESTS ----------------------------

(define p1 (make-point 0.0 10.0))
(define p2 (make-point 10.0 0.0))
(define seg (make-segment p1 p2))
(define mid-point (midpoint-segment seg))
(print-point mid-point)



