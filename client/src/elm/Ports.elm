port module Ports exposing (saveGameToLocalStorage)

import Models exposing (Model)


port saveGameToLocalStorage : Model -> Cmd msg
