#lang planet neil/sicp

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

; imprime en pantalla cada elemento de la lista por separado
(define (display-each seq)
  (cond ((not (null? seq))
         (display (car seq))
         (newline)
         (display-each (cdr seq)))))

; ordered-triples
(define (ordered-triples n s)
  (define (generate-seq n)
    (cond ((>= n 3) (enumerate-interval 3 n))
          (else nil)))
  (define (sum? x) 
    (= s (+ (car x) (cadr x) (caddr x))))
  (filter sum? (map (lambda (x) (list (- x 2) (- x 1) x)) 
                    (generate-seq n))))

; tests
(display-each (ordered-triples 12 12))


