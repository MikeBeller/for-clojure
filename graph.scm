(define (assert msg s)
  (if (not s) (display msg)))

(assert "foo" (= 1 1))
(assert "blat\n" (= 1 2))

(define (remove item list)
  (if (= item (car list))
    (cdr list)
    (cons (car list) (remove item (cdr list)))))

(assert "remove1\n" (equal? (remove 7 '(1 3 5 7 9)) '(1 3 5 9)))

(define (graph-tour gr)
  (if (null? gr)
      true
        (let* ((p (car gr))
              (a (car p))
              (b (cdr p)))
          p)))

(display (graph-tour '(('a . 'b) ('c . 'd))))

