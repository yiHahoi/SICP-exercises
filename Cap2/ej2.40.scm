#lang planet neil/sicp

; cuadrado de x
(define (square x) (* x x))

; es a divisor de b?
(define (divides? a b)
  (= (remainder b a) 0))

; busca menor divisor de n
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

; menor divisor de n
(define (smallest-divisor n)
  (find-divisor n 2))

; es n primo?
(define (prime? n)
  (= n (smallest-divisor n)))

; filtra la secuencia
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

; genera secuencia de enteros continuos desde low a high
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; acumula con append el map de un proc
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

; pares [i,j]  que cumplen: [ 1 <= j < i <= n ]
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

; es la suma de los elementos del par un numero primo?
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

; genera el conjunto (i,j,i+j)
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

; numeros tal que i+j es primo
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

; imprime en pantalla cada elemento de la lista por separado
(define (display-each seq)
  (cond ((not (null? seq))
         (display (car seq))
         (newline)
         (display-each (cdr seq)))))

; tests
(display-each (prime-sum-pairs 10))

