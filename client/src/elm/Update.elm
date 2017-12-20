module Update exposing (update)

import Models exposing (Model)
import Msgs exposing (Msg)
import Ports exposing (saveGameToLocalStorage)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.Click ->
            ( { model | clicks = model.clicks + 1, money = model.money + 1 * model.multiplier }, Cmd.none )

        Msgs.AddAmountPerSecond _ ->
            ( { model | money = model.money + model.amountPerSecond * model.multiplier }, Cmd.none )

        Msgs.SaveGame _ ->
            ( model, Cmd.batch [ saveGameToLocalStorage model ] )

        Msgs.BuyLemonande ->
            ( { model | lemonandes = model.lemonandes + 1, amountPerSecond = model.amountPerSecond + 0.1 }, Cmd.none )

        Msgs.ToggleSidebar ->
            ( { model | sidebarVisible = not model.sidebarVisible }, Cmd.none )
