module View exposing (view)

import Html exposing (Html, div, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Models exposing (Model)
import Msgs exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "site__wrapper" ]
        [ div [ class "score" ] [ text <| "current money: " ++ toString (round model.money) ++ " $" ]
        , img [ class "clicker", src "static/img/clicker.png", onClick Click ] []
        , img [ class "lemonande_buy", src "static/img/lemonande.jpg", onClick BuyLemonande ] []
        ]
