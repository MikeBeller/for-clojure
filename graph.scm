(define-macro (test form)
  `(begin 
     (display "TEST ")
     (if ,form
       (display "OK: ")
       (display "FAIL: "))
     (display (quote ,form))(display ": ")
     (newline)))

(test (= (log 1) 0))

(define (filter pred lst)
  (reverse
    (let loop ((l lst) (r '()))
      (if (null? l) r
        (let ((i (car l)))
          (if (pred i)
            (loop (cdr l) (cons i r))
            (loop (cdr l) r)))))))

(define (even? x) (= 0 (modulo x 2)))
(test (equal? (filter even? '(1 2 3 4 5 6)) '(2 4 6)))

(define (remove i lst)
  (filter (lambda (x) (not (eqv? x i))) lst))
(test (equal? (remove 2 '(1 2 3)) '(1 3)))

(define (boolean x) (not (not x)))

(define (any? pred lst)
  (boolean (some pred lst)))

(define (some pred lst)
  (if (null? lst) #f
    (if (pred (car lst))
      (car lst)
      (some pred (cdr lst)))))

(define (graph-tour gr)
  (let ((i (car gr)))
    (g-t i (remove i gr))))

(define (g-t e1 gr)
  (if (null? gr) #t
    (any? boolean
      (map
        (lambda (e2)
          (cond
            ((equal? (cdr e1) (car e2))
             (g-t e2 (remove e2 gr)))
            ((equal? (cdr e1) (cdr e2))
             (g-t (cons (cdr e2) (car e2)) (remove e2 gr)))
            (else #f)))
        gr))))


(test (graph-tour '((a . b) (c . b))))
(test (not (graph-tour '((a . b) (c . x)))))

(test 
  (graph-tour
    '((a . b) (a . c) (c . b) (a . e) (b . e) (a . d) (b . d) (c . e) (d . e) (c . f) (d . f))))

(test
  (not
    (graph-tour
           '((a . b) (b . c) (c . d) (x . y) (d . a) (b . e)))))
