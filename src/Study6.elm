module Study6 exposing (..)


list =
    [ 1, 2, 3 ]


hoge =
    case list of
        a :: b ->
            10 :: b

        [] ->
            []
