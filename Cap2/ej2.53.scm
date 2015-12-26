#lang planet neil/sicp


(display (list 'a 'b 'c))
(newline)
; (a b c)

(display (list (list 'george)))
(newline)
; ((george))

(display (cdr '((x1 x2) (y1 y2))))
(newline)
; ((y1 y2))

(display (cadr '((x1 x2) (y1 y2))))
(newline)
; (y1 y2)

(display (pair? (car '(a short list))))
(newline)
; (pair? 'a) -> #f
         
(display (memq 'red '((red shoes) (blue socks))))
(newline)
; #f
         
(display (memq 'red '(red shoes blue socks)))
(newline)
; es el primer elemento por lo que devuelve:
; (red shoes blue socks)

