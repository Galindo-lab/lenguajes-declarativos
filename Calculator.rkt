
#lang racket/gui

;; frame
(define frame
  (new frame%
       [label "Calculadora"]
       [width 400]
       [height 150]))


(define output-display
  (new panel%
       [parent frame]
       [alignment '(center center)]
       [style '(border auto-hscroll vscroll)]))


(define output
   (new message%
        [parent output-display]
        [auto-resize #t]
        [label "1+1 = 2"]))

(define (set-output value )
  (send output set-label value) )

(define ribbon
  (new horizontal-panel%
       [stretchable-height #f]
       [parent frame]
       [alignment '(left center)]))

  (define n1
    (new text-field%
         [label ""]
         [parent ribbon]))

  (define op
    (new text-field%
         [label ""]
         [parent ribbon]))

  (define n2
    (new text-field%
         [label ""]
         [parent ribbon]))

(define send-button
  (new button%
       [label "send"]
       [parent ribbon]
       [callback
        (lambda (button event)
          (let* ([op (string-ref (send op get-value) 0)]
                 [n1 (string->number (send n1 get-value))]
                 [n2 (string->number (send n2 get-value))])
               (cond
                 [(char=? op #\+ )(set-output (number->string (+ n1 n2)))]
                 [(char=? op #\- )(set-output (number->string (- n1 n2)))]
                 [(char=? op #\* )(set-output (number->string (* n1 n2)))]
                 [(char=? op #\/ )(set-output (number->string (exact->inexact (/ n1 n2))))]
                 [else (set-output "operacion no disponible")])
               ))]))

(define clear
  (new button%
       [label "clear"]
       [parent ribbon]
       [callback (lambda (button event)
                   (set-output "")
                   (send op set-value "")
                   (send n1 set-value "")
                   (send n2 set-value "")
                   )]))

 
(send frame show #t)
; Show the frame by calling its show method
