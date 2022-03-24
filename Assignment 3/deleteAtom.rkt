
;A function that takes an atom and a list as parameters and returns a list identical
;to its parameter list except with all instances of the given atom deleted.
(define (deleteAtom list1 atom1) 
  ;If the list is empty, then an empty list will be returned.
  ;
  ;If the list is not empty, the function will go through each element in the list until it finds
  ;an element in the list that matches with the atom to be deleted. Then it constructs a new list.
  ;This process is repeated until all instances of the to-be-deleted atom are gone from the list.
  (cond
      ((null? list1) '())

      ;If the element in the list is a sublist, the function will go through that sublist as well and delete
      ;any atoms that match with the atom to-be-deleted, then construct a new sublist.
      ((list? (car list1)) (cons (deleteAtom (car list1) atom1) (deleteAtom (cdr list1) atom1)))
      ((equal? (car list1) atom1) (deleteAtom (cdr list1) atom1)) 
      (else
        (cons (car list1) (deleteAtom (cdr list1) atom1))
       )
  )
)

;Test cases

(deleteAtom '(a b c d a c a a) 'a)
(deleteAtom '((a b) c () d a c a a) 'a)
(deleteAtom '(((a (a)) b) c () d a c a a) 'a)
(deleteAtom '(a b c d a c (a ((a))) a a) 'a)
(deleteAtom '(r a c e c a r) 'a)
(deleteAtom '(a a a a) 'a)
(deleteAtom '(A b c d A c A a) 'a)
(deleteAtom '(b c d c) 'a)
(deleteAtom '(65 65) 'a)
(deleteAtom '() 'a)