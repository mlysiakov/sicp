; Exercise 1.16: 
; Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. 
; (Hint: Using the observation that (b^n/2)^2=(b^2)^n/2, keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product ab^n is unchanged from state to state. 
; At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

#lang sicp 

(#%require rackunit)

(define (fast-expt b n) 
    (fast-expt-iterative b n 1))

(define (square x) (* x x))

(define (fast-expt-iterative b n total)
    ;(display "b=") (display b) (display " n=") (display n)  (display " total =") (display total) (newline)
    (cond ((= n 0) total)
	    ((even? n) (fast-expt-iterative (square b) (/ n 2) total))
	    ((odd?  n) (fast-expt-iterative b (- n 1) (* total b)))))

(check-equal? (fast-expt 2 0) 1)
(check-equal? (fast-expt 2 1) 2)
(check-equal? (fast-expt 2 7) 128)
(check-equal? (fast-expt 2 8) 256)  