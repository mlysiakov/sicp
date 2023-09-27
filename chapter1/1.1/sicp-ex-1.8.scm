; Exercise 1.8:
; Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value
; ((x/y2) + 2y) / 3.

#lang sicp

(define (square x) (* x x)) 

(define (good-enough? old-guess new-guess)
    (< (abs (- old-guess new-guess)) (* new-guess 0.001)))

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))


(define (sqrt-iter old-guess new-guess x) 
    (if (good-enough? old-guess new-guess)
        new-guess
        (sqrt-iter new-guess (improve old-guess x) x)))

(define (sqrt-cube x)
  (sqrt-iter 1.0 2.0 x))   


(sqrt-cube 27)
; 3.001274406506175

(sqrt-cube (+ 100 37))
; 5.1552597174244825

(sqrt-cube (+ (sqrt-cube 2) (sqrt-cube 3)))
; 1.3932442408130556

(* (sqrt-cube 1000) (sqrt-cube 1000))
; 100.02410863964595  