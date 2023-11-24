#lang racket

(require "../../utils.scm")
(#%require rackunit)

(define (increment x) (+ 1 x))

(define (nextOdd n)
  (if (even? n) (increment n) (+ n 2)))

;(define (smallest-divisor n)
    ;(find-divisor n 2 increment))  

(define (smallest-divisor n)
    (find-divisor n 2 1))


;(define (smallest-divisor-improved n)
    ;(find-divisor n 2 nextOdd))  

(define (smallest-divisor-improved n)
  (if (divides? 2 n) 
      2
      (find-divisor n 3 2)))


 
(define (find-divisor n test-divisor increment)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ increment test-divisor)
               increment))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (prime-improved? n)
  (= n (smallest-divisor-improved n)))  

(check-equal? (smallest-divisor 199) 199)
(check-equal? (smallest-divisor 1999) 1999)
(check-equal? (smallest-divisor 19999) 7)

(check-equal? (smallest-divisor 199) (smallest-divisor-improved 199))
(check-equal? (smallest-divisor 1999) (smallest-divisor-improved 1999))
(check-equal? (smallest-divisor 19999) (smallest-divisor-improved 19999))

(provide smallest-divisor smallest-divisor-improved prime? prime-improved?)