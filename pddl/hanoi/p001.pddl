;;;; 3 disks, 3 stacks
(define (problem hanoi-3-3)
    (:domain hanoi)
    (:objects
        b a c - disk s1 s2 s3 -stack
    )
    (:init

        (clear a)
        (ontable c s1)
        (on b c s1)
        (on a b s1)
        (is_on a  s1)
        (is_on b  s1)
        (is_on c  s1)
        (emptystack s2)
        (emptystack s3)
        (handempty)
        (inferior a b)
        (inferior b c)
        (inferior a c)

    )
    (:goal
        (and (on a b s3) (on b c s3) (ontable c s3))
    )
)