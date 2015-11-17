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


;------------------ RECTANGULO IMPLEMENTACION 1 ------------------

; genera un rectangulo en base a un punto p, el ancho w y la altura h
; en esta implementacion solo se almacenan p, w y h
(define (make-rect-2 p w h)
  (cons p (cons w h)))

; devuelve el ancho w
(define (rect-width-2 x) ; SELECTOR
  (car (cdr x)))

; devuelve el alto h
(define (rect-height-2 x) ; SELECTOR
  (cdr (cdr x)))

;------------------ RECTANGULO IMPLEMENTACION 2 ------------------

; genera un rectangulo en base a un punto p, el ancho w y la altura h
; en esta implementacion se representa el rectangulo con solo dos segmentos
(define (make-rect-1 p w h) ; CONSTRUCTOR
  (let ((segment1 (make-segment p (make-point (x-point p) 
                                              (+ h (y-point p)))))
        (segment2 (make-segment p (make-point (+ w (x-point p)) 
                                              (y-point p)))))
    (cons segment1 segment2)))

; devuelve el ancho w
(define (rect-width-1 x) ; SELECTOR
  (let ((x1 (x-point (start-segment (cdr x))))
        (x2 (x-point (end-segment (cdr x)))))
    (abs (- x1 x2))))

; devuelve el alto h
(define (rect-height-1 x) ; SELECTOR
  (let ((y1 (y-point (start-segment (car x))))
        (y2 (y-point (end-segment (car x)))))
    (abs (- y1 y2))))

;----------------------- AREA y PERIMETRO -----------------------

(define (rect-perimeter x WIDTH-FUN HEIGHT-FUN)
  (let ((w (WIDTH-FUN x))
        (h (HEIGHT-FUN x)))
    (+ (* 2 w) (* 2 h))))

(define (rect-area x WIDTH-FUN HEIGHT-FUN)
  (let ((w (WIDTH-FUN x))
        (h (HEIGHT-FUN x)))
    (* w h)))

;---------------------------- TESTS ----------------------------

(define p (make-point 2.34 11.0))
(define rect-1 (make-rect-1 p 61.3 7.5))
(define rect-2 (make-rect-2 p 61.3 7.5))

(newline)

(display "perimetro implementacion 1: ")
(rect-perimeter rect-1 rect-width-1 rect-height-1)
(display "area implementacion 1: ")
(rect-area rect-1 rect-width-1 rect-height-1)

(newline)

(display "perimetro implementacion 2: ")
(rect-perimeter rect-2 rect-width-2 rect-height-2)
(display "area implementacion 2: ")
(rect-area rect-2 rect-width-2 rect-height-2)

(newline)

; Por lo que es posible representar de formas distintas los datos
; y reutilizar los mismos procedimientos para area y perimetro, 
; siempre y cuando los procedimientos que sirven de interfaz 
; entre los distintos niveles de abstracción entreguen los mismos datos.
