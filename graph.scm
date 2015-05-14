
(define (graph-tour gr)
  ;(display gr) (newline)
  (if (null? (cdr gr)) #t
    (let ((e1 (car gr)))
      (let loop ((g (cdr gr)) (seen '()))
        (if (null? g) #f
          (let ((e2 (car g)))
            (cond
              ((equal? (cdr e1) (car e2))
               (graph-tour (cons e2 (append seen (cdr g)))))
              ((equal? (cdr e1) (cdr e2))
               (graph-tour (cons (cons (cdr e2) (car e2)) (append seen (cdr g)))))
              (else (loop (cdr g) (cons e2 seen))))))))))


(display "true ") (display (graph-tour '((a . b) (c . b)))) (newline)
(display "false ") (display (graph-tour '((a . b) (c . x)))) (newline)

(display "true ")
(display (graph-tour '((a . b) (a . c) (c . b) (a . e) (b . e) (a . d) (b . d) (c . e) (d . e) (c . f) (d . f))))
(newline)

