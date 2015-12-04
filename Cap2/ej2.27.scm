#lang planet neil/sicp

; devuelve una lista invertida
(define (reverse lst)
  (sub-reverse lst (length lst)))

(define (sub-reverse lst size)
  (if (= size 0)
      nil
      (cons (list-ref lst (dec size))
            (sub-reverse lst (dec size)))))

; devuelve una lista invertida, incluyendo listas internas
(define (deep-reverse lst)
  (sub-deep-reverse lst (length lst)))

(define (sub-deep-reverse lst size)
  (cond ((= size 0) nil)
        ((list? (list-ref lst (dec size))) 
         (cons (sub-deep-reverse (list-ref lst (dec size)) 
                                 (length (list-ref lst (dec size))))
               (sub-deep-reverse lst (dec size))))
        (else (cons (list-ref lst (dec size)) 
                    (sub-deep-reverse lst (dec size))))))


; test
(define x (list (list 1 2) (list 3 4)))
(display x)
(newline)
(display (reverse x))
(newline)
(display (deep-reverse x))