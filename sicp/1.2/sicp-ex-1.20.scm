; Exercise 1.20:
; Explaini how many times remainder function executed in applicative and normal-order evaluation process for bellow function?

#lang sicp

(#%require rackunit)

(define (euclid_gcd a b) 
    (if (= b 0) a
        (euclid_gcd b (remainder a b))))


(check-equal? (euclid_gcd 28 16) 4)
(check-equal? (euclid_gcd 206 40) 2)
(check-equal? (euclid_gcd 135 115) 5)        


;; Normal-order evaluation of (euclid_gcd 206 40) produces:
;; -------------------------------------------------

; Call #1
; (euclid_gcd 206 40)
; (if (= 40 0)

; Call #2
; (euclid_gcd 40                  <-- a
;             (remainder 206 40)) <-- b
; (if (= (remainder 206 40) 0) => (if (= 6 0)) <-- is evaluated +1

; Call #3
; (euclid_gcd (remainder 206 40)                  <-- a
;             (remainder 40 (remainder 206 40)))  <-- b
; (if (= (remainder 40 (remainder 206 40)) 0) => (if (= 4 0))  ; <-- is evaluated +2
  
; Call #4
; (euclid_gcd (remainder 40 (remainder 206 40))                                   <-- a
;             (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) ; <-- b           
; (if (= (remainder (remainder 206 40)                 
;		 (remainder 40 (remainder 206 40)) 0) => (if (= 2 0)) <-- is evaluated +4
   

; Call #5
; (euclid_gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))                                                 <-- a
;	          (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))  <-- b
; (if (= (remainder (remainder 40 (remainder 206 40)) ; 
;		 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) => (if (0 = 0)) <-- is evaluated +7
; return (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) <-- is evaluated +4

; Total number of evaluation of remainder procedure in normal-order processing is 18

;; Applicative-order evaluation 
;; ----------------------------

; (gcd 206 40)
; (gcd 40 (remainder 206 40)) ; rem returns 6
; (gcd 6 (remainder 40 6))    ;             4
; (gcd 4 (remainder 6 4))     ;             2
; (gcd 2 (remainder 4 2))     ;             0

; Total number of evaluation of remainder procedure in applicative-order processing is 4