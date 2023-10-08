; Exercise 1.6: 
; Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. 
; “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. 
; Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

;(define (new-if predicate 
;               then-clause 
;                else-clause)
;  (cond (predicate then-clause)
;        (else else-clause)))


; Alyssa uses new-if to rewrite the square-root program:

; (define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x) x)))

; What happens when Alyssa attempts to use this to compute square roots? Explain.

#lang sicp

(#%require rackunit)

(define (new-if predicate then-clause  else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(check-equal? (new-if (= 2 3) 0 5) 5)
(check-equal? (new-if (= 1 1) 0 5) 0)

(define (good-enough? guess x)
    (< (abs (- (* guess guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))   

(define (average x y) 
    (/ (+ x y) 2))    


(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))        

; It won't work because the `if` statement evaluates operands only after predicate resolved. 
; While new-if, as a simply procedure call, requires operand to be evaluated before entering.
; Which leads to endless recursion loop due to the fact that sqrt-iter point to sqrt-iter under one operand.   