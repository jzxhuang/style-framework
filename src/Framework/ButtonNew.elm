module Framework.ButtonNew exposing
    ( Config
    , Size(..)
    , State(..)
    , defaultConfig
    , toButtonAttr
    )

{-| [Demo](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Buttons/States)

[![Buttons](https://lucamug.github.io/style-framework/images/demos/buttons.png)](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Buttons/States)

-}

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Framework.ColorNew exposing (findIdealTextColor)
import Framework.ConfigurationNew as Configuration
import Framework.SpinnerNew as Spinner
import Html
import Html.Attributes
import Html.Events


type alias Config =
    { color : Maybe Element.Color
    , outlined : Bool
    , state : State
    , size : Maybe Size
    }


defaultConfig : Config
defaultConfig =
    { color = Nothing
    , outlined = False
    , state = Default
    , size = Nothing
    }


type Size
    = Small
    | Large
    | Jumbo


type State
    = Default
    | Loading
    | Disabled


toFontSize : Configuration.Configuration -> Maybe Size -> Int
toFontSize configuration maybeSize =
    case maybeSize of
        Just size ->
            case size of
                Small ->
                    configuration.font.small

                Large ->
                    configuration.font.large

                Jumbo ->
                    configuration.font.jumbo

        Nothing ->
            configuration.font.default


toButtonPadding : Configuration.Configuration -> Maybe Size -> Attribute msg
toButtonPadding configuration maybeSize =
    (case maybeSize of
        Just size ->
            case size of
                Small ->
                    configuration.button.paddingSmall

                Large ->
                    configuration.button.paddingLarge

                Jumbo ->
                    configuration.button.paddingJumbo

        Nothing ->
            configuration.button.paddingDefault
    )
        |> (\padding_ -> paddingXY padding_.x padding_.y)


toButtonAttr : Configuration.Configuration -> Config -> List (Attribute msg)
toButtonAttr configuration buttonConfig =
    let
        cc =
            Maybe.withDefault configuration.button.defaultColorBackground buttonConfig.color

        fontColor =
            if buttonConfig.outlined then
                Maybe.withDefault (findIdealTextColor configuration configuration.button.defaultColorBackground) buttonConfig.color

            else
                findIdealTextColor configuration cc

        backgroundColor =
            -- if buttonConfig.state == Disabled then
            --     Framework.ColorNew.adjustLightness 10 cc
            -- else
            if buttonConfig.outlined && buttonConfig.color /= Nothing then
                configuration.color.transparent

            else
                cc

        borderColor =
            Maybe.withDefault configuration.button.defaultColorBorder buttonConfig.color

        fontSize =
            toFontSize configuration buttonConfig.size

        -- buttonHeight
        buttonPadding =
            toButtonPadding configuration buttonConfig.size

        -- fontColor =
        --     case buttonConfig.state of
        --         Outlined ->
        --             cc
        --         Loading ->
        --             Framework.ColorNew.transparent
        --         Waiting ->
        --             Framework.ColorNew.transparent
        --         Disabled ->
        --             Framework.ColorNew.disabledButtonFont
        --         _ ->
        --             if buttonConfig.color == Framework.ColorNew.white then
        --                 Framework.ColorNew.greyDark
        --             else
        --                 Framework.ColorNew.white
        backgroundMouseOverColor =
            case buttonConfig.color of
                Just _ ->
                    if buttonConfig.outlined then
                        Framework.ColorNew.adjustLightness -configuration.button.hoverColorDelta cc

                    else
                        backgroundColor
                            |> Framework.ColorNew.adjustLightness -configuration.button.hoverColorDelta
                            |> Framework.ColorNew.saturate 0.9

                Nothing ->
                    backgroundColor

        fontMouseOverColor =
            if buttonConfig.outlined then
                findIdealTextColor configuration backgroundMouseOverColor

            else
                fontColor

        borderMouseOverColor =
            borderColor
                |> Framework.ColorNew.adjustLightness -configuration.button.hoverColorDelta
                |> Framework.ColorNew.saturate 0.9

        -- fontMouseOverColor =
        --     case buttonConfig.state of
        --         Loading ->
        --             Framework.ColorNew.transparent
        --         Outlined ->
        --             Framework.ColorNew.white
        --         _ ->
        --             fontColor
        --                 |> Framework.ColorNew.lighten 0.8
        --                 |> Framework.ColorNew.saturate 0.9
        borderRadius =
            Border.rounded <| 2

        -- case buttonConfig.size of
        --     Small ->
        --         2
        --     _ ->
        --         3
        -- Needs to be reworked
        spinnerColor =
            if cc == configuration.color.white then
                configuration.color.greyDark

            else
                configuration.color.white

        -- Sketchy : I use a width fill height fill el to with solid bg to block the text
        inFrontAddon =
            case buttonConfig.state of
                Loading ->
                    [ inFront
                        (el [ width fill, height fill, Background.color backgroundColor, htmlAttribute <| Html.Attributes.style "pointer-events" "none" ] <|
                            el [ centerY, centerX ] <|
                                Spinner.spinner Spinner.Rotation fontSize fontColor
                        )
                    ]

                _ ->
                    []
    in
    [ Font.size fontSize
    , Font.color fontColor
    , Background.color backgroundColor
    , buttonPadding
    , borderRadius
    , Border.width 1
    , Border.color borderColor
    ]
        ++ (if buttonConfig.state == Default then
                [ mouseOver
                    [ Font.color fontMouseOverColor
                    , Background.color backgroundMouseOverColor
                    , Border.color borderMouseOverColor
                    ]
                ]

            else
                [ htmlAttribute <| Html.Attributes.style "pointer-events" "none"
                ]
                    ++ (if buttonConfig.state == Disabled then
                            [ htmlAttribute <| Html.Attributes.style "opacity" "0.5" ]

                        else
                            []
                       )
           )
        ++ inFrontAddon
        -- ++ [ width (px 56), height (px 56) ]
        ++ [ width fill, height fill ]



-- ToDo: sizes, disabled, nicer default height, loading
