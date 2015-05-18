(define-macro (test form)
  `(begin 
     (display "TEST ")
     (if ,form
       (display "OK: ")
       (display "FAIL: "))
     (display (quote ,form))(display ": ")
     (newline)))

;(test (= (log 1) 0))

(define (filter pred lst)
  (reverse
    (let loop ((l lst) (r '()))
      (if (null? l) r
        (let ((i (car l)))
          (if (pred i)
            (loop (cdr l) (cons i r))
            (loop (cdr l) r)))))))

;(define (even? x) (= 0 (modulo x 2)))
;(test (equal? (filter even? '(1 2 3 4 5 6)) '(2 4 6)))

(define (remove i lst)
  (filter (lambda (x) (not (eqv? x i))) lst))
;(test (equal? (remove 2 '(1 2 3)) '(1 3)))

(define (boolean x) (not (not x)))

(define (any? pred lst)
  (boolean (some pred lst)))

(define (some pred lst)
  (if (null? lst) #f
    (if (pred (car lst))
      (car lst)
      (some pred (cdr lst)))))

