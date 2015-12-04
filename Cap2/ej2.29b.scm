#lang planet neil/sicp

; ----------------------  mobile ----------------------

; constructor mobile
(define (make-mobile left right)
  (list left right))

; selector left-branch
(define (left-branch mob)
  (car mob))

; selector right-branch
(define (right-branch mob)
  (car (cdr mob)))

; ----------------------  branch ----------------------

; constructor branch
(define (make-branch length structure)
  (list length structure))

; selector length
(define (branch-length branch)
  (car branch))

; selector structure
(define (branch-structure branch)
  (car (cdr branch)))

; ----------------------  weight ----------------------

; peso total de un mobile
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

; peso total de una branch
(define (branch-weight branch)
  (let ((struct (branch-structure branch)))
    (cond ((pair? struct) (total-weight struct))
           (else struct))))

; -----------------------------------------------------

; tests

(define branch1 (make-branch 5.64 25.0))
(define branch2 (make-branch 4.63 15.0))
(define mobile1 (make-mobile branch1 branch2))
(define branch3 (make-branch 6.22 10.0))
(define branch4 (make-branch 4.63 mobile1))
(define mobile2 (make-mobile branch3 branch4))

(display (total-weight mobile2))
(newline)

; -----------------------------------------------------
