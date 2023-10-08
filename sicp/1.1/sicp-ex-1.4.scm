; Exercise 1.4: 
; Observe that our model of evaluation allows for combinations whose operators are compound expressions. 
; Use this observation to describe the behavior of the following procedure:

#lang sicp

(#%require rackunit)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(check-equal? (a-plus-abs-b 3 1) 4)
(check-equal? (a-plus-abs-b 3 -1) 4)
(check-equal? (a-plus-abs-b -3 1) -2)
(check-equal? (a-plus-abs-b -3 -1) -2)


; Operators could be a compound expression itself. 
; Combination `(if (> b 0) + -)` whill result in `+` when b positive and `-` when b negative
;
; Example: (a-plus-abs-b 3 1)
;   ((if (> 1 0) + -) 3 1))
;   ((if #t + -) 3 1))
;   (+ 3 1)
;   4
;
; Example: (a-plus-abs-b 3 -1)
;   ((if (> -1 0) + -) 3 -1))
;   ((if #f + -) 3 -1))
;   (- 3 -1)
;   4