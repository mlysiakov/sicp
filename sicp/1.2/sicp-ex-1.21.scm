;Exercise 1.21: 
; Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.

#lang sicp

(#%require "./divisor/smallest-divisor.scm")
(#%require rackunit)


(check-equal? (smallest-divisor 199) 199)
(check-equal? (smallest-divisor 1999) 1999)
(check-equal? (smallest-divisor 19999) 7)        
