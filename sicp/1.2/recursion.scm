#lang sicp 

(#%require rackunit)

(define (factorial_simple n)
    (if (= n 1) 
        1 
        (* n (factorial_simple(- n 1)))
    )
)

(define (factorial_iter_recursive n)
    (factorial_iter 1 1 n))

(define (factorial_iter tmp counter max_count) 
    (if (> counter max_count)
        tmp
        (factorial_iter (* tmp counter) (+ counter 1) max_count)
    )
)

(check-equal? (factorial_simple 6) 720)
(check-equal? (factorial_iter_recursive 6) 720)


(define (fibonacci n)
    (cond
        ((= 0 n) 0)
        ((= 1 n) 1)
        (else (+ (fibonacci (- n 1))
                 (fibonacci (- n 2))))
    )
)

(define (fibonacci_iterative n)
    (fibonacci_iteration 1 0 n) )

(define (fibonacci_iteration a b counter)
    (if (= counter 0) 
        b
        (fibonacci_iteration (+ a b) a (- counter 1))))    

(check-equal? (fibonacci 10) 55)
(check-equal? (fibonacci_iterative 10) 55)

