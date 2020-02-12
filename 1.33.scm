(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (filtered-accumulate combiner null-value filter term a next b)
  (define (iter a result)
    (cond ((> a b) result)
	  ((filter a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))

(define (sum-square-primes a b)
  (filtered-accumulate + 0 prime? square a (lambda (x) (+ x 1)) b))

(sum-square-primes 1 19)

(define (identity x) x)

(define (product-relative-primes n)
  (filtered-accumulate * 1 (lambda (x) (= (gcd x n) 1)) identity 1 (lambda (x) (+ x 1)) n))

(product-relative-primes 19)
