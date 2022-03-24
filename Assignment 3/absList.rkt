
;A function that takes a list (with no sublists) as an argument and returns a list of absolute values
;of each of the elements.
(define (absList input)
  ;If the list is an empty list with 0 numbers, function will return the empty list.
  ;
  ;If the list is not empty, function will return list with absolute values.
  (if (null? input)
        '()
        
        ;Constructs a list by finding the absolute value of each number in the list by
        ;iterating through the entire list and applying the 'abs' built-in function.
        ;The 'abs' built-in function takes an argument and returns the absolute value
        ;of the argument.
        (cons (abs (car input)) (absList (cdr input)))
      )
)



;Test cases

(absList '())
(absList '(1 2 3 4))
(absList '(100 2135 242 35 -4))
(absList '(-1 -2 -3 -4))
(absList '(3.22 456 78 2.0))
(absList '(-5.16 -6.15 -7.19))
(absList '(-0))
(absList '(-100 -200 -587.25))
(absList '(-89.99))
(absList '(0 1 2 3 4))