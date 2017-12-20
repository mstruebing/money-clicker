module Msgs exposing (Msg(..))

import Time exposing (Time)


type Msg
    = Click
    | AddAmountPerSecond Time
    | SaveGame Time
    | BuyLemonande
    | ToggleSidebar
