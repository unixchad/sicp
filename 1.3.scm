(define (square x)
        (* x x))

(define (sos x y)
        (+ (square x) (square y)))

(define (soslargest a b c)
  (cond ((and (< a b) (< a c)) (sos b c))
	((and (< b a) (< b c)) (sos a c))
	(else (sos a b))))

(soslargest 1 2 3)
