#lang planet neil/sicp


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
  (define (ancho x) (- (upper-bound x) (lower-bound x)))
  (cond ((= (ancho y) 0) (error "ERROR: Ancho de intervalo es cero."))
        (else (mul-interval x
                            (make-interval (/ 1.0 (upper-bound y))
                                           (/ 1.0 (lower-bound y)))))))

; resta dos intervalos
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

; constructor con width
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

; selector center
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

; selector width
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

; constructor con porcentaje
(define (make-center-percent center percent)
  (let ((width (* center (/ percent 100.0))))
    (make-center-width center width)))

; selector porcentaje
(define (percent interval)
  (* 100 (/ (width interval) (center interval))))


