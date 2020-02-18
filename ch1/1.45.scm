(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (loop f n result)
    (if (= n 1)
      result
      (loop f (- n 1) (compose f result))))
  (loop f n f))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
	       1.0))
(sqrt 16)

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y))))
	       1.0))
(cube-root 27)

(define (quad-root x)
  (fixed-point (repeated
		 (average-damp (lambda (y) (/ x (* y y y))))
		 2)
	       1.0))
(quad-root 81)

(define (power x n)
  (define (loop x n result)
    (if (= n 1) result
      (loop x (- n 1) (* result x))))
  (loop x n x))
(power 3 2)

(define (n-root x n)
  (fixed-point (repeated
		 (average-damp (lambda (y) (/ x (power y (- n 1)))))
		 n)
	       1.0))
(n-root 81 4)
