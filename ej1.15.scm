#lang planet neil/sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
(if (not (> (abs angle) 0.1))
    angle
(p (sine (/ angle 3.0)))))

; (sine 12.15)
; de desarrollara de la siguiente manera:
; (p (sine (/ 12.15 3)))
; (p (p (sine (/ 4.05 3))))
; (p (p (p (sine (/ 1.35 3)))))
; (p (p (p (p (sine (/ 0.45 3))))))
; (p (p (p (p (p (sine (/ 0.15 3))))))) = (p (p (p (p (p (sine 0.05))))))

; a) Se requirio aplicar p 5 veces.

; ademas se observa que 12.15 = (((((3*0.05)*3)*3)*3)*3) = 0.05*3^5
; por lo que:
; 12.15/0.05 = 3^5
; lo que podemos representar como:
; a/0.1 = 3^n    aplicando log_3
; log_3 (a/0.1) = n

; b) Por lo tanto el total de pasos necesarios n es de:
; n = log_3 (a/b)
; donde a es el angulo y b el angulo desde el que se considera lo suficientemente pequeño.
; Ademas, el uso de memoria crece de forma proporcional al numero de pasos, es decir:
; memoria = K * log_3 (a/b)

