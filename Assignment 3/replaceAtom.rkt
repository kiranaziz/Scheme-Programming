
;A function that takes two atomss and a list as parameters and returns a list identical
;to the parameter list except all occurrences of the first given atom in the list are
;replaced with the second given atom, no matter how deeply the first atom is nested.
(define (replaceAtom origAtom replacementAtom list1)
  ;If the list is empty, then an empty list will be returned.
  ;
  ;If the list is not empty, the function will go through each element in the list until it finds
  ;an element in the list that matches with the atom to be replaced. Then it replaces that original atom
  ;with the desired atom and constructs a new list.
  ;This process is repeated until all instances of the to-be-replaced atom are gone from the list.
  (cond
      ((null? list1) '())

      ;If the element in the list is a sublist, the function will go through that sublist as well and replace
      ;any atoms that match with the atom to-be-replaced, then constructs a new sublist with the replacement/desired atom.
      ((list? (car list1)) (cons (replaceAtom origAtom replacementAtom (car list1)) (replaceAtom origAtom replacementAtom (cdr list1))))
      ((equal? (car list1) origAtom) (cons replacementAtom (replaceAtom origAtom replacementAtom (cdr list1))))
      (else
        (cons (car list1) (replaceAtom origAtom replacementAtom (cdr list1)))
      )
   )
)


;Test cases

(replaceAtom  'a 'z '(a b c d a c a a))
(replaceAtom  'a 'z '((a b) c () d a c a a))
(replaceAtom  'a 'z '(((a (a)) b) c () d a c a a))
(replaceAtom  'a 'z '(a b c d a c (a ((a))) a a))
(replaceAtom  'a 'z '(r a c e c a r))
(replaceAtom  'a 'z '(a a a a))
(replaceAtom  'a 'z '(A b c d A c A a))
(replaceAtom  'a 'z '(b c d c))
(replaceAtom  'a 'z '(65 65))
(replaceAtom  'a 'z '())