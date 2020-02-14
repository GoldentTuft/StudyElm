module Study5 exposing (..)


type TypingData a
    = TypingData String


type Waiting
    = Waiting


type Typing
    = Typing


type Miss
    = Miss


type Finish
    = Finish


new : String -> TypingData Waiting
new str =
    TypingData str


typeTo : TypingData (Waiting or Typing or Miss) -> TypingData (Typing or Miss or Finish)
typeTo (TypingData str) =
    TypingData str



-- こうしたいができない。
