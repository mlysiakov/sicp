; Exercise 1.26: 
; Rewritten the expmod procedure to use an explicit multiplication, rather than calling square make code works 2x slower. Why? 

#lang sicp

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (* (expmod base (/ exp 2) m)
             (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base 
             (expmod base (- exp 1) m))
          m))))


; New version of expmod doesn’t user a square function, but use a *. This might not seem a lot, but the interpreter uses applicative-order evaluation, meaning it will “evaluate the arguments and then apply”.
; In case of (square (expmod base (/ exp 2) m)), the parameter of square will be evaluated once, then square will be applied.
; In the case of (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)) each of the two parameters of * will be fully evaluated before the * will be applied. Since both are recursive call, it will double the work to do, whenever this branch is executed. The complexity becomes 
; Θ(log 2^n) = Θ(n log 2) = Θ(n).