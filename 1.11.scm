;(define (fib n)
;  (cond ((< n 3) n) 
;	(else (+ 
;		(fib (- n 1))
;		(* 2 (fib (- n 2)))
;		(* 3 (fib (- n 3)))))))

(define (fib n)
  (define (fib-iter a b c count)
    (if (= count 0)
      c
      (fib-iter (+ a (* 2 b) (* 3 c)) 
  	      a 
  	      b 
  	      (- count 1))))
  (if (< n 3)
    n
    (fib-iter 2 1 0 n)))

(fib 2)
(fib 7)
(fib 8)
