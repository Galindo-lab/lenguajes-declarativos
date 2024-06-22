
#lang racket/gui

;; https://es.wikipedia.org/wiki/Serie_de_Leibniz
(define (leibniz n)
  (if (not (= n -1))
      (+ (/ (expt -1 n) (+ (* 2 n) 1)) (leibniz (sub1 n)))
      0 ))

;; https://es.wikipedia.org/wiki/Producto_de_Wallis
(define (wallis n)
  (if (not (= n 0))
      (*  (/ (* 4 (expt n 2))  (- (* 4 (expt n 2)) 1))  (wallis (sub1 n)))
      1 ))

(define (leibniz-pi x)
  (* 4 (leibniz (expt 10 x))))

(define (wallis-pi n)
  (* 2 (wallis (expt 10 n) )) )
