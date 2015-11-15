#lang planet neil/sicp

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end ctr)
  (cond ((and (< start end) (> ctr 0)) 
         (cond ((and (not (even? start)) (fast-prime? start 10))
                (timed-prime-test start)
                (search-for-primes (+ start 2) end (- ctr 1)))
               (else (search-for-primes (+ start 1) end ctr))))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;resultados
(search-for-primes 1000 10000 3)
(search-for-primes 10000 100000 3)
(search-for-primes 100000 1000000 3)
(search-for-primes 1000000 10000000 3)

; Con lo que se obtienen los siguientes resultados:

; 1009 *** 309
; 1013 *** 213
; 1019 *** 221
; 10007 *** 316
; 10009 *** 313
; 10037 *** 280
; 100003 *** 353
; 100019 *** 316
; 100043 *** 308
; 1000003 *** 330
; 1000033 *** 333
; 1000037 *** 338

; Donde se puede observar que no se cumple lo esperado. 
; Un valor en la escala del millon deberia tomar aproximadamente el doble del tiempo
; que toma calcular un valor en la escala de los miles.



