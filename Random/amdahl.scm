#lang planet neil/sicp

; AMDAHL
; devuelve la aceleracion que se obtiene al paralelizar una fraccion de tiempo de ejecucion.
; frac  : fraccion de tiempo de ejecucion a paralelizar
; cores : numero de nucleos (aprox. la aceleracion de la fraccion paralelizable)
;
;                       1
;      s =     ------------------
;              (1 - frac) + frac
;                          -------
;                           cores

(define (amdahl frac cores)
	(/ 1 (+ (- 1 frac) (/ frac cores))))


