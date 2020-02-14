module Study2 exposing (..)


type alias Hogeable a =
    { a | hoge : Hoge }


type Hoge
    = Hoge String
    | Piyo Int


toHoge : Hogeable a -> Hoge
toHoge { hoge } =
    hoge
