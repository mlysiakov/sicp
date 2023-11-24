; Exercise 1.23:
; Improve smallest-divisor function by implementing smart test-divisor procedure to skip even divisor expcet 2.
#lang sicp

(#%require "./divisor/time-report.scm")
(#%require rackunit)

(define (search-for-primes startIndex counter)
    (if (odd? startIndex) 
            (search-for-primes-iter startIndex counter)
            (search-for-primes-iter (+ 1 startIndex) counter)))

(define (search-for-primes-iter n counter)
    (if (> counter 0)
            (if (timed-prime-test-improved n)
                (search-for-primes-iter (+ 2 n) (- counter 1))
                (search-for-primes-iter (+ 2 n) counter))))

(search-for-primes 1000000 3)
(search-for-primes 10000000 3)
(search-for-primes 100000000 3)
(search-for-primes 1000000000 3)

;  With timed-prime-test incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in Exercise 1.22.
;  Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?

; **** RESULTS ****
; 1000003    *** 4.0
; 1000033    *** 3.25
; 1000037    *** 3.75
; 10000019   *** 10.5
; 10000079   *** 11.0
; 10000103   *** 10.25
; 100000007  *** 33.75
; 100000037  *** 35.5
; 100000039  *** 34.0
; 1000000007 *** 103.25
; 1000000009 *** 114.5
; 1000000021 *** 110.5

; The execution takes faster but not actually 2x. The improvement differ from 14% to 70% in the best case. 
; I think the reason comes from the fact that compute next odd function adding additionaly computation. 
; We need to check if number is even every time we are calling next() procedure.

; Let's try to improve this and refactor the code to always use simple addition. For this we need to start improved version from divisor 3 and pass 2 as increment. 
; We also need to add additional condition to check if number is diveded by 2, but we can do it only once.

; **** RESULTS ****
; 1000003 *** 2.0
; 1000033 *** 2.25
; 1000037 *** 2.0
; 10000019 *** 5.75
; 10000079 *** 6.0
; 10000103 *** 6.0
; 100000007 *** 18.5
; 100000037 *** 18.25
; 100000039 *** 18.5
; 1000000007 *** 58.25
; 1000000009 *** 61.75
; 1000000021 *** 68.0


; As a result we can see that execution time become faster for both initial and improved methods. And improved method gain even more benefit from it. 
; Now our improved method is close to 2x faster then original one.

; Outcome: It important not only to find a way to improve algorithm mathematically but also find a way to implement this improvement efficintly.
; And also time/space complexity is difficult ;D 