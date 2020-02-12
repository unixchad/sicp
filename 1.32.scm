(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
       (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (factorial n)
  (accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (factorial-iter n)
  (accumulate-iter * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(factorial 1)
(factorial 2)
(factorial 3)
(factorial 4)

(factorial-iter 1)
(factorial-iter 2)
(factorial-iter 3)
(factorial-iter 4)
