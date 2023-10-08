;Exercise 1.11: 
; Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

;           1
;         1   1
;       1   2   1
;     1   3   3   1
;   1   4   6   4   1
; 1   5   10  10  5   1

#lang sicp

(#%require rackunit)

(define (pascal_triangle row column)
    (if 
        (or (< row 1) (< column 1) (= row column)) 1 
        (+ (pascal_triangle (- row 1) column) (pascal_triangle (- row 1) (- column 1)))))


(check-equal? (pascal_triangle 0 0) 1)
(check-equal? (pascal_triangle 4 0) 1)
(check-equal? (pascal_triangle 4 4) 1)
(check-equal? (pascal_triangle 2 1) 2)
(check-equal? (pascal_triangle 3 2) 3)
(check-equal? (pascal_triangle 5 3) 10)
(check-equal? (pascal_triangle 5 4) 5)