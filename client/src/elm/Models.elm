module Models exposing (Model, initialModel)


type alias Model =
    { money : Float
    , clicks : Int
    , multiplier : Float
    , amountPerSecond : Float
    , lemonandes : Int
    , sidebarVisible : Bool
    }


initialModel : Model
initialModel =
    { money = 0
    , clicks = 0
    , multiplier = 1
    , amountPerSecond = 0
    , lemonandes = 0
    , sidebarVisible = True
    }
