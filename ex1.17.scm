(define (fast-mult a b)
  (cond ((= b 0) 0)
  ((even? b) (double (fast-mult a (half b ))))
  (else (+ a (fast-mult a (- b 1))))))

(define (double a)
  ( + a a))

(define (half a)
  ( / a 2))

(define (even? n)
  (= (remainder n 2) 0))

(fast-mult 8 9)
