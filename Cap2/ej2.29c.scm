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

; peso total de un mobile
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

; mobile balanceado?
(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    ; se comparan los pesos de ambos lados
    (and (= (* (branch-weight left) (branch-length left))
            (* (branch-weight right) (branch-length right)))
         ; la rama izquierda es un mobile? de ser asi se encuentra balanceada?
         (if (pair? (branch-structure left)) 
             (balanced? (branch-structure left))
             #t)
         ; la rama derecha es un mobile? de ser asi se encuentra balanceada?
         (if (pair? (branch-structure right)) 
             (balanced? (branch-structure right))
             #t))))

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

; peso total de una branch
(define (branch-weight branch)
  (let ((struct (branch-structure branch)))
    (cond ((pair? struct) (total-weight struct))
           (else struct))))

; ----------------------  tests ----------------------

; mobile1 = balanced
(define branch1 (make-branch 2.00 25.0))
(define branch2 (make-branch 25.0 2.00))
(define mobile1 (make-mobile branch1 branch2))

; mobile2 = balanced
(define branch3 (make-branch 50.0 1.00))
(define branch4 (make-branch 1.00 50.0))
(define mobile2 (make-mobile branch3 branch4))

; mobile3 = unbalanced
(define branch5 (make-branch 1.00 mobile1))
(define branch6 (make-branch 1.00 mobile2))
(define mobile3 (make-mobile branch5 branch6))

; mobile4 = balanced
(define branch7 (make-branch 51.00 mobile1))
(define branch8 (make-branch 27.00 mobile2))
(define mobile4 (make-mobile branch7 branch8))

(display (balanced? mobile1))
(newline)
(display (balanced? mobile2))
(newline)
(display (balanced? mobile3))
(newline)
(display (balanced? mobile4))
(newline)

; -----------------------------------------------------
