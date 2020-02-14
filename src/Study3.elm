module Study3 exposing (..)


type alias User =
    { login : String
    , isAdmin : Bool
    }


type alias Authorized user =
    { user
        | canEdit : Bool
        , canDelete : Bool
    }


type alias Hoge sub =
    { sub
        | hoge : String
    }


alice : Hoge (Authorized User)
alice =
    { login = "alice"
    , isAdmin = False
    , canEdit = True
    , canDelete = False
    , hoge = "HOGE"
    }


bob : Authorized {}
bob =
    { canEdit = True
    , canDelete = True
    }


suzuki =
    { login = "suzuki"
    , isAdmin = False
    , canEdit = True
    , canDelete = False
    , hoge = "suzuki HOGE"
    }


getLogin { login } =
    login


getHoge a =
    a.hoge


allowToEdit : Authorized a -> Bool
allowToEdit a =
    a.canEdit



{- }
   isAdmin : Authorized a -> Bool
   isAdmin a =
       a.isAdmin
-}
