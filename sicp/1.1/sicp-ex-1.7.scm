; Excersice 1.7:
; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. 
; Also, in real computers, arithmetic operations are almost always performed with limited precision. 
; This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers.

; An alternative strategy for implementing good-enough? is to watch how guess changes 
; from one iteration to the next and to stop when the change is a very small fraction of the guess. 
; Design a square-root procedure that uses this kind of end test

#lang sicp

(#%require rackunit)

(define (good-enough? old-guess new-guess)
    (< (abs (- old-guess new-guess)) (* new-guess 0.001)))

(define (improve guess x)
  (average guess (/ x guess)))   

(define (average x y) 
    (/ (+ x y) 2))    


(define (sqrt-iter old-guess new-guess x) 
    (if (good-enough? old-guess new-guess)
        new-guess
        (sqrt-iter new-guess (improve old-guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 1.2 x))   


(sqrt 10000000000000)
(sqrt 0.000000000009)

(check-equal? (sqrt 9) 3.0000077718292104)
(check-equal? (sqrt (+ 100 37)) 11.704744587153954)
(check-equal? (sqrt (+ (sqrt 2) (sqrt 3))) 1.7737797885789313)
(check-equal? (* (sqrt 1000) (sqrt 1000)) 1000.2405050741451)

; The issue for small number comes from the fact that iteration needed to find answer fall smaller then delta. So we end up with wrong answer coz iterations completed too early.
; For big numbers, the program will stack in endless loop. The issue also relates to delta but this time every next iteration (even close to truth) are larget then delta.
; The solution to modify `good-enough?` method to compare old and new guess works better in this case
