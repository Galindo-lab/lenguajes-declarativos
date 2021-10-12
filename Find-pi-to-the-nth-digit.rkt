
#lang racket/gui

(define (leibniz n)                     ;(expt 10 x)
  (if (not (= n -1))
      (+ (/ (expt -1 n) (+ (* 2 n) 1)) (leibniz (sub1 n)))
      0 ))

(define (calc-pi x)
  (* 4 (leibniz (expt 10 x))))
