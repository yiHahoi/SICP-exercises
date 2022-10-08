#lang sicp

; ----------------------------------------------------------

; procedimiento make-account con clave
(define (make-account balance main-password)
  (let ((error-counter 0))
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
    ; si se falla 7 veces consecutivas al ingresar la clave se llama a la policia
    (define (call-the-cops)
      (display "CALLING THE COPS!! Wee-ooH! Wee-ooH! Wee-ooH!")
      (newline))
    ; procedimiento a devolver que pide una clave y una funcion a realizar (m)
    (define (dispatch password m)
      (cond ((not (correct? password)) 
             (begin (set! error-counter (+ error-counter 1)) 
                    (if (> error-counter 6) (call-the-cops))
                    (error "Incorrect Password!")))
            (else (begin (set! error-counter 0) 
                         (cond ((eq? m 'withdraw) withdraw)
                               ((eq? m 'deposit) deposit)
                               (else (error "Unknown request -- MAKE-ACCOUNT" m)))))))
    ; se devuelve un procedimiento que recibe dos argumentos
    dispatch))


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

; para comprobar que se aplica el procedimiento (call-the-cops) al 
; ocurrir 7 errores de clave consecutivos se debe hacer un deposito o 
; retiro de la cuenta utilizando una clave errada desde el interpretador.
; (esto se debe a que al utilizar el procedimiento "error" se detiene el programa)

; ----------------------------------------------------------