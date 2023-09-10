; Exercise 1.5: 
; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. 
; He defines the following two procedures:

#lang sicp

(define (p) (p))

(define (test x y) 
  (if (= x 0) 0 y))


; Then he evaluates the expression
(test 0 (p))

; What behavior will Ben observe with an interpreter that uses applicative-order evaluation? 
; What behavior will he observe with an interpreter that uses normal-order evaluation? 
; Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)

; First to mention that procedure p is pointed to itself. Once called it makes a recursive call to itself.
; From this we can say that:
; For applicative-order evaluation the programm will freeze in endless loop. Interpretor will try to evaluate (p) before calling test which starts endless recursion
; For normal-order evaluation the program will sucesfully run and return 0. With given operands the value of `y` (in test) won't be evaluated at all which prevent endless loop.
; But if we change test combination to anything then 0 for `x` operand the normal-order evaluation will also end in endless loop.