#lang sicp

; ----------------------------------------------------------

; procedimiento x^2
(define sqr 
  (lambda (x) 
    (* x x)))

; monitorea el total de llamadas a proc
(define (make-monitored proc)
  (let ((counter 0))
    (define (watch x)
      (cond ((eq? x 'how-many-calls?) counter)
            (else (begin (set! counter (+ counter 1))
                         (proc x)))))
    watch))

; ----------------------- test -----------------------------

; procedimiento cuadrado monitoreado
(define monitored-sqr (make-monitored sqr))

(display (monitored-sqr 'how-many-calls?))
(newline)
(display (monitored-sqr 2))
(newline)
(display (monitored-sqr 3))
(newline)
(display (monitored-sqr 4))
(newline)
(display (monitored-sqr 5))
(newline)
(display (monitored-sqr 'how-many-calls?))
(newline)

; ----------------------------------------------------------