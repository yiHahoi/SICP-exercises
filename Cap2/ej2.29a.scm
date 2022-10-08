#lang sicp
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
