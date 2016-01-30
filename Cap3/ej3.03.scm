#lang planet neil/sicp

; ----------------------------------------------------------

; procedimiento make-account con clave
(define (make-account balance main-password)
  ; realiza un retiro
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  ; realiza un deposito
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  ; es la clave correcta?
  (define (correct? password)
    (eq? password main-password))
  ; procedimiento a devolver que pide una clave y una funcion a realizar (m)
  (define (dispatch password m)
    (cond ((not (correct? password)) (error "Incorrect Password!"))
          (else (cond ((eq? m 'withdraw) withdraw)
                      ((eq? m 'deposit) deposit)
                      (else (error "Unknown request -- MAKE-ACCOUNT" m))))))
  ; se devuelve un procedimiento que recibe dos argumentos
  dispatch)


; ----------------------- test -----------------------------

; crea una cuenta
(define acc (make-account 100 'asdf))

; deposito
(display ((acc 'asdf 'deposit) 50))
(newline)
; retiro
(display ((acc 'asdf 'withdraw) 100))
(newline)
; clave errada
(display ((acc 'hola! 'deposit) 50))
(newline)

; ----------------------------------------------------------