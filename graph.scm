(define (filter pred lst)
  (reverse
    (let loop ((l lst) (r '()))
      (if (null? l) r
        (let ((i (car l)))
          (if (pred i)
            (loop (cdr l) (cons i r))
            (loop (cdr l) r)))))))

;(define (even? x) (= 0 (modulo x 2)))
;(display (filter even? '(1 2 3 4 5 6)))

(define (remove i lst)
  (filter (lambda (x) (not (eq? x i))) lst))

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


(display "true ") (display (graph-tour '((a . b) (c . b)))) (newline)
(display "false ") (display (graph-tour '((a . b) (c . x)))) (newline)

(display "true ")
(display (graph-tour '((a . b) (a . c) (c . b) (a . e) (b . e) (a . d) (b . d) (c . e) (d . e) (c . f) (d . f))))
(newline)

(display "false ")
(display (graph-tour
           '((a . b) (b . c) (c . d) (x . y) (d . a) (b . e))))
(newline)
