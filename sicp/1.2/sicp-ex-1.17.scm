; Exercise 1.17: 
; The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. 
; In a similar way, one can perform integer multiplication by means of repeated addition. 
; The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:

#lang sicp

(#%require rackunit)

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(check-equal? (* 2 2) 4)
(check-equal? (* 2 8) 16)
(check-equal? (* 5 3) 15)  
(check-equal? (* 3 6) 18)         
(check-equal? (* 5 45) 225)
(check-equal? (* 17 19) 323)                  

; This algorithm takes a number of steps that is linear in b. 
; Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. 
; Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.

(define (double x) (+ x x))

(check-equal? (double 2) 4)
(check-equal? (double 8) 16)      
(check-equal? (double 45) 90)   

(define (halve x) (/ x 2))

(define (** a b)
  (cond ((= b 1) a)
	    ((even? b) (** (double a) (halve b)))
	    (else (+ a (** a (- b 1))))))

(check-equal? (** 2 2) 4)
(check-equal? (** 2 8) 16)
(check-equal? (** 5 3) 15)
(check-equal? (** 3 6) 18)               
(check-equal? (** 5 45) 225)         
(check-equal? (** 17 19) 323)    