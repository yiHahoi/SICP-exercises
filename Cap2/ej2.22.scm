#lang sicp


;; metodo 1
(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
						(cons (square (car things))
									answer))))
	(iter items nil))
;; En este caso se esta procesando la lista de items de izquierda a derecha pero
;; la lista de resultados se construye de derecha a izquierda.



;; metodo 2
(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
						(cons answer
									(square (car things))))))
	(iter items nil))
;; En este caso, el primer elemento de la lista resultado será nil.



