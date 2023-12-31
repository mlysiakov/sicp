; Source code for exercises 1.6, 1.7, 1.8

#lang sicp

(#%require rackunit)

(define (good-enough? guess x)
    (< (abs (- (* guess guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))   

(define (average x y) 
    (/ (+ x y) 2))    


(define (sqrt-iter guess x) 
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))        


(check-equal? (sqrt 9) 3.00009155413138)
(check-equal? (sqrt (+ 100 37)) 11.704699917758145)
(check-equal? (sqrt (+ (sqrt 2) (sqrt 3))) 1.7739279023207892)
(check-equal? (* (sqrt 1000) (sqrt 1000)) 1000.000369924366 )