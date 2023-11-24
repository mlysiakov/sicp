; Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). 
; The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

#lang racket
(#%require "smallest-divisor.scm")
(#%require "fermat.scm")

(define (runtime) (* 1000 (current-inexact-milliseconds)))

(define (timed-prime-test n)
  (start-prime-test n (runtime) prime?))

(define (timed-prime-test-improved n)
  (start-prime-test n (runtime) prime-improved?))

(define (timed-prime-test-fermat n)
  (start-prime-fermat-test n (runtime)))

(define (start-prime-fermat-test n start-time)
  (if (fast-prime? n 100)
        (report-prime n (- (runtime) start-time)) 
        #f))    
  
(define (start-prime-test n start-time predicate)
  (if (predicate n)
        (report-prime n (- (runtime) start-time)) 
        #f))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (display "\n"))
 
(provide timed-prime-test timed-prime-test-improved timed-prime-test-fermat)