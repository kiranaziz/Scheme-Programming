
;A second helper function that applies the bubble sort algorithm to a list; the function takes a list, with
;no sublists, as the only parameter and returns a sorted list.
(define (bubblesortHelper2 list1)
  ;If the list contains only one element, then there is no sorting needed to be done. The list will
  ;just be returned.
  ;
  ;If the list is longer than one element, then the function will compare the elements in the list.
  ;At each element, if the next element is larger than the current element, then no swap is made, and 
  ;the rest of the list gets the bubblesort algorithm applied. If the next element is smaller than
  ;the current element, then the elements are swapped and the function moves onto the rest of the list.
  (if (null? (cdr list1))   
        list1   
        (if (< (car list1) (car (cdr list1)))   
            (cons (car list1) (bubblesortHelper2 (cdr list1)))   
            (cons (car (cdr list1)) (bubblesortHelper2 (cons (car list1) (cdr (cdr list1)))))
        )
   )
)


;A helper function that assists in the bubble sort algorithm to a list; the function takes a
;number, the length of the list to be sorted, and the list itself, which has no sublists, as
;the parameters and returns a sorted list.
(define (bubblesortHelper1 N list1)    
  ;If the list's length is one, then the second helper function will be called to
  ;apply the appropriate operations on the list. This is the base case.
  ;
  ;If the list's length is greater than one, then the function calls itself and
  ;uses the second helper function to actually perform the bubblesort.
  (cond
        ((= N 1) (bubblesortHelper2 list1))   
        (else
          (bubblesortHelper1 (- N 1) (bubblesortHelper2 list1))
        )
    )
)


;A function that applies the bubble sort algorithm to a list; the function takes a list, with
;no sublists, as the only parameter and returns a sorted list. This third function makes it easier
;for the user to use the function, and one less parameter to be inputted.
(define (bubblesort list1)
    ;The 'length' built-in function that returns the length of a list.
    ;Here, the length of the list is a parameter for the bubblesortHelper1 function.
    (bubblesortHelper1 (length list1) list1))




;Test cases

(bubblesort '(5 1 4 2 8))
(bubblesort '(-5 -1 -4 -2 -8))
(bubblesort '(5 4 3 2 1))
(bubblesort '(5))
(bubblesort '(-1 -2 0 1 2))
(bubblesort '(514 28 32))
(bubblesort '(5.14 3.2 -1 7))
(bubblesort '(257 708 731 8000))
(bubblesort '(0 0 0 1))
(bubblesort '(-5 5))