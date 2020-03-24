module SmoothScroll exposing (..)


scrollTo : String -> Float -> Cmd Msg
scrollTo id y =
    let
        step =
            8

        sub : Float -> Task Dom.Error ()
        sub cy =
            Dom.setViewportOf id 0 cy
                |> Task.andThen (\_ -> Process.sleep 10)
                |> Task.andThen
                    (if cy < y then
                        \_ -> sub (cy + step)

                     else
                        Task.succeed
                    )
    in
    Task.attempt (\_ -> NoOp) (sub step)
