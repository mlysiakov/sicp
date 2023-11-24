; Exercise 1.24: 
; Modify the timed-prime-test procedure of Exercise 1.22 to use fast-prime? (the Fermat method), and test each of the 12 primes you found in that exercise. 
; Since the Fermat test has Θ(log n) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? 
; Do your data bear this out? Can you explain any discrepancy you find?

#lang sicp

(#%require "./divisor/time-report.scm")
(#%require rackunit)

(timed-prime-test-fermat 1000003)
(timed-prime-test-fermat 1000033)
(timed-prime-test-fermat 1000037)
(timed-prime-test-fermat 10000019)
(timed-prime-test-fermat 10000079)
(timed-prime-test-fermat 10000103)
(timed-prime-test-fermat 100000007)
(timed-prime-test-fermat 100000037)
(timed-prime-test-fermat 100000039)
(timed-prime-test-fermat 1000000007)
(timed-prime-test-fermat 1000000009)
(timed-prime-test-fermat 1000000021)

; **** RESULTS ****
; 1000003    *** 47.25
; 1000033    *** 46.0
; 1000037    *** 47.25
; 10000019   *** 53.0
; 10000079   *** 68.75
; 10000103   *** 53.5
; 100000007  *** 60.5
; 100000037  *** 60.5
; 100000039  *** 66.0
; 1000000007 *** 70.0
; 1000000009 *** 66.5
; 1000000021 *** 74.0


; The increase of input in 10x time gives constant grow of around 7 (average) microseconds. We can proove algorithm complexity is O(log n)
; Although that for smaller number prime? is faster, fast-prime? become much faster with larger and larger prime.

