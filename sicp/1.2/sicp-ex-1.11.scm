;Exercise 1.11: 
;A function f is defined by the rule that f(n)=n if n<3 and f(n)=f(n−1)+2f(n−2)+3f(n−3) if n≥3. 
;Write a procedure that computes f by means of a recursive process. 
;Write a procedure that computes f by means of an iterative process.

#lang sicp

(#%require rackunit)

(define (function_recur n)
    (if (< n 3) 
        n 
        (+ 
            (function_recur (- n 1)) 
            (* 2 (function_recur (- n 2)))
            (* 3 (function_recur (- n 3)))
        )
    )
)

(define (calculate_operand a b c)
    (+ a (* 2 b) (* 3 c)))


(define (function_iter n)
    (if (< n 3) 
        n 
        (function_iteration 2 1 0 n)
    )
)

(define (function_iteration a b c count)
    (if (< count 3) 
        a
        (function_iteration (calculate_operand a b c) a b (- count 1))
    )
)

; Test helper function to calculate total next amount of operand for iterative function
(check-equal? (calculate_operand 2 1 0) 4)
(check-equal? (calculate_operand 4 2 1) 11)
(check-equal? (calculate_operand 11 4 2) 25)


; Test recursive algorithm
(check-equal? (function_recur 2) 2)
(check-equal? (function_recur 3) 4)       
(check-equal? (function_recur 4) 11)       
(check-equal? (function_recur 7) 142)   

; Test iterative algorithm
(check-equal? (function_iter 2) 2)
(check-equal? (function_iter 3) 4)       
(check-equal? (function_iter 4) 11)       
(check-equal? (function_iter 7) 142)   