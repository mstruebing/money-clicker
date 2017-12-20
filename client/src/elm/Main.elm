port module Main exposing (..)

import Html exposing (Html)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (view)


main : Program (Maybe Model) Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Maybe Model -> ( Model, Cmd Msg )
init maybeModel =
    case maybeModel of
        Just jsonModel ->
            ( jsonModel, Cmd.none )

        Nothing ->
            ( initialModel, Cmd.none )
