(load "lib.scm")

(define (connected? a b)
  (or
    (eqv? (car a) (car b))
    (eqv? (car a) (cdr b))
    (eqv? (cdr a) (car b))
    (eqv? (cdr a) (cdr b))))

(test (connected? '(2 . 3) '(1 . 2)))

(define (gr-connected edges)
  (let loop ((es (cdr edges)) (seen (list (car edges))))
    (if (null? es) #t
      (let
        ((e (some
              (lambda (a)
                (any?
                  (lambda (b) (connected? a b))
                  seen))
              es)))
         (if e
           (loop (remove e es) (cons e seen))
           #f)))))

(test (gr-connected '((a . a))))
(test (gr-connected '((a . b))))
(test (not (gr-connected '((1 . 2) (2 . 3) (3 . 1) (4 . 5) (5 . 6) (6 . 4)))))
(test (gr-connected '((1 . 2) (2 . 3) (3 . 1) (4 . 5) (5 . 6) (6 . 4) (3 . 4))))
(test (not (gr-connected '((a . b) (b . c) (c . d) (x . y) (d . a) (b . e)))))
(test (gr-connected '((a . b) (b . c) (c . d) (x . y) (d . a) (b . e) (x . a))))



