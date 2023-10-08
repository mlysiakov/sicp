#lang sicp

(#%require rackunit)

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0)) 
         0)
        (else 
         (+ (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(check-equal? (count-change 3) 1)     ;(3x1)
(check-equal? (count-change 5) 2)     ;(1x5) (5x1)
(check-equal? (count-change 8) 2)     ;(1x5, 3x1) (8x1)
(check-equal? (count-change 10) 4)    ;(1x10) (2x5) (1x5, 5x1) (10x1)
(check-equal? (count-change 25) 13)   
;(1x25) (2x10, 1x5) (2x10 5x1) (1x10 3x5) (1x10 2x5 5x1) (1x10 1x5 10x1) (1x10 15x1) (5x5) (4x5 5x1) (3x5 10x1) (2x5 15x1) (1x5 20x1) (25x1) 
(check-equal? (count-change 100) 292) 