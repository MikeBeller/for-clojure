(load "lib.scm")

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
