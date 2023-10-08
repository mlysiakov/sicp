; Exercise 1.3: 
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (sumOfSquares x y) 
    (+  (square x) 
        (square y)))

(define (<= x y) (not (> x y)))

(define (sumOfLargestTwoSquares x y z) 
    (cond 
        ((and (<= x y) (<= x z)) (sumOfSquares y z))
        ((and (<= y x) (<= y z)) (sumOfSquares x z))
        (else (sumOfSquares x y))))

(check-equal? (sumOfLargestTwoSquares 1 2 3) 13)
(check-equal? (sumOfLargestTwoSquares 3 2 1) 13)
(check-equal? (sumOfLargestTwoSquares 1 3 2) 13)
(check-equal? (sumOfLargestTwoSquares 2 2 2) 8)
(check-equal? (sumOfLargestTwoSquares 1 2 2) 8)
(check-equal? (sumOfLargestTwoSquares 1 1 2) 5)
(check-equal? (sumOfLargestTwoSquares 4 2 3) 25)

