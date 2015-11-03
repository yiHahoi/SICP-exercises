#lang planet neil/sicp

;funcion f por recursion
(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1))
                 (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

;funcion f por iteracion
(define (f-iter n)
   (if (< n 3)
       n
       (f-subiter 2 1 0 n)))

(define (f-subiter a b c count)
   (if (< count 3)
       a
       (f-subiter (+ a (* 2 b) (* 3 c))
               a
               b
               (- count 1))))


;funcion f por iteracion, otro metodo
(define (f-iter2 n)
    (if (< n 3)
        n
        (f-subiter2 n 2 0 1 2)))

(define (f-subiter2 n 
                i 
                f-of-i-minus-2
                f-of-i-minus-1
                f-of-i)
    (if (= i n)
        f-of-i
        (f-subiter2 n
                (+ i 1)
                f-of-i-minus-1
                f-of-i
                (+ f-of-i
                   (* 2 f-of-i-minus-1)
                   (* 3 f-of-i-minus-2)))))



;test recursivo
(f-rec 1)
(f-rec 2)
(f-rec 3)
(f-rec 4)
(f-rec 5)
(f-rec 6)

;test iterativo
(f-iter 1)
(f-iter 2)
(f-iter 3)
(f-iter 4)
(f-iter 5)
(f-iter 6)

;test iterativo 2
(f-iter2 1)
(f-iter2 2)
(f-iter2 3)
(f-iter2 4)
(f-iter2 5)
(f-iter2 6)

