module StudyFold exposing (..)

{- 🤔
   myFoldl (::) [] [1,2,3]
   1 :: [] => [1]
   2 :: [1] => [2, 1]
   3 :: [2, 1] => [3, 2, 1]
-}


myFoldl : (a -> b -> b) -> b -> List a -> b
myFoldl func acc list =
    case list of
        [] ->
            acc

        x :: xs ->
            myFoldl func (func x acc) xs



{- 🤔
   myFoldr (::) [] [1,2,3]
   ((::) 1 ((::) 2 ((::) 3 [])))
   1 :: (2 :: (3 :: []))

    > List.foldr (\n str -> str ++ " " ++ String.fromInt n) "Prime: " [2,3,5,7,11]
   "Prime:  11 7 5 3 2" : String
   これはこうなるのか。
   ややこしいなぁ。
   (\7 (\11 "Prime" -> "Prime: " ++ 11) -> "Prime: 11" ++ 7)
-}


myFoldr : (a -> b -> b) -> b -> List a -> b
myFoldr func ini list =
    case list of
        [] ->
            ini

        x :: xs ->
            func x (myFoldr func ini xs)



{-
   > import StudyFold as S
   > S.myFoldr2 [1, 2, 3]
   [10,200,3000] : List Int

   > S.myFoldr2 [1, 2, 3, 4]
   [10,200,30,400] : List Int

   > S.myFoldr2 []
   [] : List Int
   > S.myFoldr2 [1]
   [1000] : List Int
   > S.myFoldr2 [1, 2]
   [10,200] : List Int
-}


myFoldr2 : List Int -> List Int
myFoldr2 list =
    case list of
        [] ->
            []

        x1 :: x2 :: xs ->
            x1 * 10 :: x2 * 100 :: myFoldr2 xs

        x :: xs ->
            x * 1000 :: myFoldr2 xs



{-
   > S.myFoldr3 (List.indexedMap Tuple.pair ["a", "b", "c", "d", "e"])
   ["","b","cc","ddd","eeee"]
-}


myFoldr3 : List ( Int, String ) -> List String
myFoldr3 list =
    case list of
        [] ->
            []

        x :: xs ->
            case x of
                ( i, s ) ->
                    String.repeat i s :: myFoldr3 xs



{-
   > S.myFoldr4 ["a", "b", "c", "d", "e"]

   ["","b","cc","ddd","eeee"]
-}


myFoldr4 : List String -> List String
myFoldr4 list =
    myFoldr4Helper 0 list


myFoldr4Helper : Int -> List String -> List String
myFoldr4Helper i list =
    case list of
        [] ->
            []

        x :: xs ->
            String.repeat i x :: myFoldr4Helper (i + 1) xs



{-
   > S.myFoldr5 [1]
   [100] : List Int
   > S.myFoldr5 [1, 2]
   [10,200] : List Int
   > S.myFoldr5 [1, 2, 3]
-}


myFoldr5 : List Int -> List Int
myFoldr5 list =
    case list of
        [] ->
            []

        x :: [] ->
            [ x * 100 ]

        x :: xs ->
            x * 10 :: myFoldr5 xs
