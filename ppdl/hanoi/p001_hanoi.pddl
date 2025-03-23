(define (problem blocks-4-0)
    (:domain blocks)
    (:objects
        d b a c - block s1 s2 s3 -stack
    )
    (:init

        (clear a)
        (ontable d s1)
        (on c d s1)
        (on b c s1)
        (on a b s1)
        (is_on a  s1)
        (is_on b  s1)
        (is_on c  s1)
        (is_on d  s1)
        (emptystack s2)
        (emptystack s3)
        (handempty)
        (inferior a b)
        (inferior b c)
        (inferior c d)
        (inferior a c)
        (inferior a d)
        (inferior b d)

    )
    (:goal
        (and (on a b s3) (on b c s3) (on c d s3))
    )
)