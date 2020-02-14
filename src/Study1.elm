module Study1 exposing (..)


type alias User =
    { name : String
    , mail : String
    }


type alias Score =
    { time : Int
    , miss : Int
    , user : User
    }


type alias Model =
    { id : Int
    , score : Score
    }


setUser : User -> Model -> Model
setUser newUser model =
    let
        score =
            model.score

        newScore =
            { score | user = newUser }
    in
    { model | score = newScore }


setScore : Score -> Model -> Model
setScore newScore model =
    { model | score = newScore }


update : Model -> Model
update model =
    let
        pUser =
            model.score.user

        newUser =
            { pUser | name = "hoge" }
    in
    { model | id = 5 } |> setUser newUser


init : Model
init =
    { id = 0
    , score =
        { time = 0
        , miss = 0
        , user =
            { name = ""
            , mail = ""
            }
        }
    }


piyo : Int -> List String -> String
piyo num list =
    "ppiiyyoo"


hoge : String
hoge =
    piyo 5
        (case "hoge" of
            "piyo" ->
                [ "piyo", "piyo" ]

            "hoge" ->
                [ "hoge", "hoge" ]

            _ ->
                [ "etc" ]
        )
