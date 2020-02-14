module Study4 exposing (InputString, new, sanitize)


type InputString a
    = InputString String


type Raw
    = Raw


type Sanitized
    = Sanitized


new : String -> InputString Raw
new str =
    InputString str


sanitize : InputString Raw -> InputString Sanitized
sanitize (InputString str) =
    InputString str
