#lang sicp

(define (fast-expt b n) 
    (fast-expt-iterative b n 1))

(define (square x) 
    (display "square ")(display x)(newline) 
    (* x x))

(define (fast-expt-iterative b n total)
    ;(display "b=") (display b) (display " n=") (display n)  (display " total =") (display total) (newline)
    (cond ((= n 0) total)
	    ((even? n) (fast-expt-iterative (square b) (/ n 2) total))
	    ((odd?  n) (fast-expt-iterative b (- n 1) (* total b)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (expmod-p base exp m)
  (remainder (fast-expt base exp) m))

 (define (report-elapsed-time start-time) 
   (display " *** ") 
   (display (- (runtime) start-time))) 


(define start-time (runtime)) 
;(expmod 999999 1000000 1000000)
(report-elapsed-time start-time) 

(define start-time2 (runtime)) 
;(expmod-p 999999 1000000 1000000)
(report-elapsed-time start-time2)  

; The modified version of expmod computes huge intermediate results which makes it work slower