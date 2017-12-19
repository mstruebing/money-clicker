port module Main exposing (..)

import Html exposing (Html, div, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Json.Decode as Json exposing (Decoder, Value)
import Json.Decode.Pipeline as Json


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
    }


initialModel : Model
initialModel =
    { money = 0, clicks = 0, multiplier = 1 }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- DECODER


saveGameDecoder : Decoder Model
saveGameDecoder =
    Json.decode Model
        |> Json.optional "money" Json.int 0
        |> Json.optional "clicks" Json.int 0
        |> Json.optional "multiplier" Json.float 1



-- UPDATE


type Msg
    = Increment
    | ReadGame (Maybe Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | clicks = model.clicks + 1, money = model.money + round (1 * model.multiplier) }, saveGameToLocalStorage model )

        ReadGame Nothing ->
            ( model, Cmd.none )

        ReadGame maybeModel ->
            ( initialModel, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "site__wrapper" ]
        [ div [ class "score" ] [ text <| "current money: " ++ toString model.money ++ " $" ]
        , img [ class "clicker", src "static/img/clicker.png", onClick Increment ] []
        ]
