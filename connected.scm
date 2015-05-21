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

; need to still write 'normalize' - change graph from list of edges
;  to a assoc with car equal node name, cdr equal list of connected nodes
; need to write set-extend, which adds items in second arg to list in
;  first arg, only for items not already in the list
;(define graphcon (edges)
;  (let ((gr (normalize edges)))
;    (let loop ((todo (list (caar gr))) (tosee (map car gr)))
;      (if (null? todo) (null? tosee)
;        (let ((node (car todo)))
;          ; if node still to be seen, add its connected nodes to "todo"
;          (if (member node tosee)
;            (loop ((set-extend todo (cdr node)) (remove (car node) tosee)))))))))


(test (gr-connected '((a . a))))
(test (gr-connected '((a . b))))
(test (not (gr-connected '((1 . 2) (2 . 3) (3 . 1) (4 . 5) (5 . 6) (6 . 4)))))
(test (gr-connected '((1 . 2) (2 . 3) (3 . 1) (4 . 5) (5 . 6) (6 . 4) (3 . 4))))
(test (not (gr-connected '((a . b) (b . c) (c . d) (x . y) (d . a) (b . e)))))
(test (gr-connected '((a . b) (b . c) (c . d) (x . y) (d . a) (b . e) (x . a))))



