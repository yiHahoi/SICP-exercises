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
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end ctr)
  (cond ((and (< start end) (> ctr 0)) 
         (cond ((and (not (even? start)) (prime? start))
                (timed-prime-test start)
                (search-for-primes (+ start 2) end (- ctr 1)))
               (else (search-for-primes (+ start 1) end ctr))))))

;resultados
(search-for-primes 1000 10000 3)
(search-for-primes 10000 100000 3)
(search-for-primes 100000 1000000 3)
(search-for-primes 1000000 10000000 3)

;con lo que se obtienen los siguientes resultados:

; 1009 *** 27
; 1013 *** 5
; 1019 *** 5
; 10007 *** 14
; 10009 *** 15
; 10037 *** 14
; 100003 *** 44
; 100019 *** 44
; 100043 *** 45
; 1000003 *** 140
; 1000033 *** 140
; 1000037 *** 140

;lo que demuestra que el algoritmo es de O(sqrt(n))



