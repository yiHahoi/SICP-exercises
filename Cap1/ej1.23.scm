#lang planet neil/sicp

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next x) 
  (cond ((= x 2) 3)
        (else (+ x 2))))

(define (prime? n)
  (= n (smallest-divisor n)))


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

; resultados problema anterior | nuevos resultados
; 1009 *** 27      |  30
; 1013 *** 5       |  3
; 1019 *** 5       |  4
; 10007 *** 14     |  10
; 10009 *** 15     |  10
; 10037 *** 14     |  10
; 100003 *** 44    |  30
; 100019 *** 44    |  30
; 100043 *** 45    |  30
; 1000003 *** 140  |  94
; 1000033 *** 140  |  94
; 1000037 *** 140  |  94

; Se puede ver que al proceso no le toma la mitad del tiempo como
; se habria esperado, esto se puede deber a que el tiempo transcurrido
; por el proceso en calcular si un numero dado es primo o no, no corresponde
; a la mayor parte del tiempo empleado por el procedimiento en general.
; Es decir, algunas de las funciones internas del procedimiento toman
; suficiente tiempo como para afectar de forma general en el tiempo del proceso.
; (buscar Ley de Amdahl para entender mejor xd)

; (segun internet xd es pq se agrega un if extra, pero no me convence xD)