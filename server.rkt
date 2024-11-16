#lang racket

(require web-server/servlet
         web-server/servlet-env
         web-server/http/bindings
         racket/port) ; Para usar port->string

(define (start request)
  (begin
    ;; Verifica si la solicitud es de tipo POST
     (when (bytes=? (request-method request) #"POST")
      (let ([bindings (request-bindings/raw request)])
        ;; Imprime los datos recibidos en la terminal
        (for ([b bindings])
          (printf "~a\n" b)
          )
        )
      )
    ;; Responde con el formulario HTML
    (response/output
     (lambda (out)
       (display "<!DOCTYPE html>
<html>
  <head>
    <title>Mi Servlet</title>
  </head>
  <body>
    <h1>¡Hola, mundo!</h1>
    <p>Esta es una respuesta HTML generada en Racket.</p>
    <a href='https://racket-lang.org'>Visita Racket.org</a>
    <!-- Formulario para enviar datos vía POST -->
    <form method='post' action='/'>
      <input type='text' name='usuario' placeholder='Tu nombre'/>
      <input type='submit' value='Enviar'/>
    </form>
  </body>
</html>" out))
     #:code 200
     #:message #"OK"
     #:mime-type #"text/html; charset=utf-8")))

;; Arranca el servidor en el puerto 8000
(serve/servlet start
               #:port 8000
               #:listen-ip #f
               #:servlet-path "/"
               #:servlet-regexp #rx"")
