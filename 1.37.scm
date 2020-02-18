; (define (cont-frac n d k)
;   (if (= k 0)
;     (/ (n k) (d k))
;     (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

; (cont-frac (lambda (i) 1.0)
; 	   (lambda (i) 1.0)
; 	   10)

(define (cont-frac n d k)
  (define (iter result k)
    (if (= k 0) result
      (iter (/ (n k) (+ result (d k))) (- k 1))))
  (iter 0 k))

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)
