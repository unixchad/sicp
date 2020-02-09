(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;normal order
;fully expand and then reduce
;don't eval until the value is needed
;(test 0 (p))
;(if (= 0 0) 0 p)

;applicative-order
;eval and apply
;(test 0 (p))
;(test 0 (p))
