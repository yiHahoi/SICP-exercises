#lang sicp

;calcula el cuadrado de x
(define (square x) (* x x))

;calcula si n es un numero par
(define (even? n)
  (= (remainder n 2) 0))


;calcula si n es numero primo
(define (prime? n)
  (= n (smallest-divisor n)))

;devuelve el menor divisor de n
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

;es a divisor de b?
(define (divides? a b)
  (= (remainder b a) 0))

;devuelve el tiempo que le toma calcular si un numero es primo
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

;busca los primeros "ctr" numeros primos que se encuentren en el rango entre start y end  
(define (search-for-primes start end ctr)
  (cond ((and (< start end) (> ctr 0))
         (cond ((and (not (even? start)) (fast-prime? start 10))
                (timed-prime-test start)
                (search-for-primes (+ start 2) end (- ctr 1)))
               (else (search-for-primes (+ start 1) end ctr))))))

;calcula si un numero es primo o no de forma probabilistica usando el test de fermat
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

;calcula b elevado a n de forma eficiente
(define (fast-exp b n)
  (fast-exp-iter b n 1))

(define (fast-exp-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-exp-iter (square b) (/ n 2) a))
        (else (fast-exp-iter b (- n 1) (* a b)))))

;calcula el modulo de un exponente con m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


;otra version de expmod
(define (expmod2 base exp m)
  (remainder (fast-exp base exp) m))



; con algunas pruebas se detecta que aunque si funciona, la nueva version es mas lenta, ya que el metodo definido en el libro
; aprovecha una propiedad de las funciones exponente y modulo