(define digit-values '((#\M . 1000) (#\D . 500) (#\C . 100) (#\L . 50) (#\X . 10) (#\V . 5) (#\I . 1)))

(define (digits s)
  (map
    (lambda (c) (cdr (assoc c digit-values)))
    (string->list s)))

(digits "MDMLC")

(define (roman->decimal roman)
  (let ((ds (digits roman)))
    (foldr
      (lambda (sm p) (if (>= (car p) (cdr p)) (+ sm (car p)) (- sm (car p))))
      0
      (map cons ds (append (cdr ds) '(0))))))

(display (roman->decimal "MCMLXXVII"))

