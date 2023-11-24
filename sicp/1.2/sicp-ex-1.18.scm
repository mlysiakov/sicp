; Exercise 1.18: 
; Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process 
; for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

#lang sicp

(#%require rackunit)

(define (double x) (+ x x)) 

(define (halve x) (/ x 2))

(define (fast-* b n) 
    (fast-*-iterative b n 0))

(define (fast-*-iterative b n total)
    ;(display "b=") (display b) (display " n=") (display n)  (display " total =") (display total) (newline)
    (cond ((= n 0) total)
	    ((even? n) (fast-*-iterative (double b) (halve n) total))
	    (else (fast-*-iterative b (- n 1) (+ total b)))))


(check-equal? (fast-* 2 2) 4)
(check-equal? (fast-* 2 8) 16)
(check-equal? (fast-* 5 3) 15)
(check-equal? (fast-* 3 6) 18)               
(check-equal? (fast-* 5 45) 225)         
(check-equal? (fast-* 17 19) 323)    