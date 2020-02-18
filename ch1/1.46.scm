(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (loop new-guess)
      (if (good-enough? new-guess)
        new-guess
	(loop (improve new-guess))))
    (loop guess)))

(define (average x y)
  (/ (+ x y) 2))
(define (sqrt-high x)
  ((iterative-improve
    (lambda (g) (< (abs (- (square g) x)) 0.001))
    (lambda (g) (average g (/ x g)))) 1.0))

(sqrt-high 16)

(define (fixed-point f first-guess)
  ((iterative-improve
     (lambda (x) (< (abs (- x (f x))) 0.00001))
     f)
   first-guess))

(fixed-point cos 1.0)
