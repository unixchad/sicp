(define (mult p q)
  (mult-iter 0 p q))
(define (mult-iter a p q)
  (cond ((= q 0) a)
	((even? q) (mult-iter a (double p) (half q)))
	(else (mult-iter (+ a p) p (- q 1)))
	)
  )

(define (double a)
  ( + a a))

(define (half a)
  ( / a 2))

(define (even? n)
  (= (remainder n 2) 0))

(mult 2 3)
(mult 8 9)
