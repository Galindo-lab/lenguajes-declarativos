#lang racket
(require racket/class)


; Definición de la clase Circle
(define circle%
  (class object%
    (init-field radius) ; Campo inicial para el radio
    
    ; Método público para calcular el área
    (define/public (area)
      (* pi (sqr radius)))
    
    ; Método público para calcular la circunferencia
    (define/public (circumference)
      (* 2 pi radius))
    
    ; Método público para mostrar información del círculo
    (define/public (display-info)
      (displayln (string-append "Circle with radius: " (number->string radius)
                                ", Area: " (number->string (send this area))
                                ", Circumference: " (number->string (send this circumference)))))
    
    (super-new))) ; Llamada al constructor de la clase base
