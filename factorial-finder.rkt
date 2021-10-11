
#lang racket/gui


(define (factorial x)
  (if (= x 0) 1
      (* x (factorial (- x 1)))))


(define factorial-finder
  (lambda ( x [y 2] )
    (cond
      [ (> (/ x y) 1 ) (factorial-finder (/ x y) (add1 y)) ]
      [ (< (/ x y) 1 ) (error "No hay factorial") ]
      [ (= (/ x y) 1 ) y ])
    )
  )
  
