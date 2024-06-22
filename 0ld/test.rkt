
#lang racket/gui


(define lista (list 1 2 3 4 5 6 7 8 9 10 11))
(define lista2 (list 1 2 3))
(define lista3 (list 4 5 6))

(define (squared value)
  (expt value 2) )

(define (factorial x)
  (if (= x 0) 1
       (* x (factorial (- x 1)))))

(define (suma-lista x)
  (if (empty? x ) 0
      (+ (car x) (suma-lista (cdr x)))))


(define vector-fuerza '(1 23 4) )
