(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (let ((temp (expmod base (/ exp 2) m)))
	   (if (non-trivial? temp m)
	     0
	     (remainder (square temp)
			m))))
	(else
	  (remainder
	    (* base (expmod base (- exp 1) m))
	    m))))

(define (non-trivial? a b)
  (cond ((= a 1) #f)
	((= a (- b 1)) #f)
	(else (= (remainder (square a) b) 1))))

(define (miller-rabin-test n)
  (define (try-it a)
     (define (check-it temp)
       (if (or (= temp 0) (= temp 1))
        (display "true")
        (display "false")
	))
     (check-it (expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1))))))

(miller-rabin-test 199)
(miller-rabin-test 1999)
(miller-rabin-test 19999)
(miller-rabin-test 3)
