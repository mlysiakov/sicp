; Exercise 1.22: 
; Write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. 
; Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000.
#lang sicp

(#%require "./divisor/time-report.scm")
(#%require rackunit)

(define (search-for-primes startIndex counter)
    (if (odd? startIndex) 
            (search-for-primes-iter startIndex counter)
            (search-for-primes-iter (+ 1 startIndex) counter)))

(define (search-for-primes-iter n counter)
    (if (> counter 0)
            (if (timed-prime-test n)
                (search-for-primes-iter (+ 2 n) (- counter 1))
                (search-for-primes-iter (+ 2 n) counter))))

(search-for-primes 1000000 3)
(search-for-primes 10000000 3)
(search-for-primes 100000000 3)
(search-for-primes 1000000000 3)

; Note the time needed to test each prime. 
; Since the testing algorithm has order of growth of Θ(√n), you should expect that testing for primes around 10,000 should take about √10 times as long as testing for primes around 1000.

; ******* RESULTS **********
; 1000003 *** 4.5
; 1000033 *** 4.0
; 1000037 *** 4.5
; 10000019 *** 13.25
; 10000079 *** 14.0
; 10000103 *** 14.0
; 100000007 *** 46.75
; 100000037 *** 41.75
; 100000039 *** 44.5
; 1000000007 *** 177.75
; 1000000009 *** 142.25
; 1000000021 *** 146.0


; When startIndex grows in 10x times execution time takes approximetly √10x time longer which proove that time complexity is Θ(√n)


; UPDATE AFTER 1.23
; After I modified the method to use `increment` variable to get next test-divisor instead of calling another method the execution become a bit faster especially for big inputs.
; Note: time complexity still follow Θ(√n) so when can say proved 2 times.
; ******* RESULTS **********
; 1000003    *** 3.75
; 1000033    *** 3.5
; 1000037    *** 4.0
; 10000019   *** 11.75
; 10000079   *** 13.25
; 10000103   *** 13.0
; 100000007  *** 39.25
; 100000037  *** 37.0
; 100000039  *** 37.25
; 1000000007 *** 124.5
; 1000000009 *** 128.25
; 1000000021 *** 125.5

