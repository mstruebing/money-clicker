port module Main exposing (..)

import Html exposing (Html, div, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Time exposing (Time, minute, second)


-- Ports


port saveGameToLocalStorage : Model -> Cmd msg



-- APP


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { money : Int
    , clicks : Int
    , multiplier : Float
    , amountPerSecond : Float
    }


initialModel : Model
initialModel =
    { money = 0, clicks = 0, multiplier = 1, amountPerSecond = 0 }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every second AddAmountPerSecond
        , Time.every minute SaveGame
        ]



-- UPDATE


type Msg
    = Increment
    | AddAmountPerSecond Time
    | SaveGame Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | clicks = model.clicks + 1, money = model.money + round (1 * model.multiplier) }, Cmd.none )

        AddAmountPerSecond _ ->
            ( { model | money = model.money + round (model.amountPerSecond * model.multiplier) }, Cmd.none )

        SaveGame _ ->
            ( model, Cmd.batch [ saveGameToLocalStorage model ] )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "site__wrapper" ]
        [ div [ class "score" ] [ text <| "current money: " ++ toString model.money ++ " $" ]
        , img [ class "clicker", src "static/img/clicker.png", onClick Increment ] []
        ]
