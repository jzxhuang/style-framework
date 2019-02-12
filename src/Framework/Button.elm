module Framework.Button exposing
    ( button, buttonWidth
    , buttonLink, buttonLinkWidth
    , buttonCustomizable
    , buttonAttr
    , introspection
    )

{-| [Demo](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Buttons/States)

[![Buttons](https://lucamug.github.io/style-framework/images/demos/buttons.png)](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Buttons/States)


# Buttons

@docs button, buttonWidth


# Buttons as Link

@docs buttonLink, buttonLinkWidth


# Customizable Buttons

@docs buttonCustomizable


# Button Attributes

@docs buttonAttr


# Introspection

Used internally to generate the [Style Guide](https://lucamug.github.io/)

@docs introspection

-}

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Framework.ColorNew
import Framework.Configuration exposing (conf)
import Framework.Modifier exposing (Modifier(..))
import Framework.SpinnerNew as Spinner
import Html
import Html.Attributes
import Html.Events
import Json.Decode


{-| -}
introspection :
    { name : String
    , description : String
    , signature : String
    , variations : List ( String, List ( Element a1, String ) )
    }
introspection =
    let
        buttonText =
            "Button"
    in
    { name = "Buttons"
    , description = "Buttons accept a list of modifiers, a Maybe msg (for example: \"Just DoSomething\") and the text to display inside the button."
    , signature = "List Modifier -> Maybe msg -> String -> Element msg"
    , variations =
        [ ( "States"
          , [ ( button [ Primary ] Nothing buttonText, "button [ Primary ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Primary, Outlined ] Nothing buttonText, "button [ Primary, Outlined ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Primary, Loading ] Nothing buttonText, "button [ Primary, Loading ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Primary, Waiting ] Nothing buttonText, "button [ Primary, Waiting ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Primary, Disabled ] Nothing buttonText, "button [ Primary, Disabled ] Nothing \"" ++ buttonText ++ "\"" )
            ]
          )
        , ( "Colors"
          , [ ( button [ Muted ] Nothing buttonText, "button [ Muted ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Primary ] Nothing buttonText, "button [ Primary ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Success ] Nothing buttonText, "button [ Success ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Info ] Nothing buttonText, "button [ Info ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Warning ] Nothing buttonText, "button [ Warning ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Danger ] Nothing buttonText, "button [ Danger ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [] Nothing buttonText, "button [] Nothing \"" ++ buttonText ++ "\"" )
            ]
          )
        , ( "Sizes"
          , [ ( button [ Small ] Nothing buttonText, "button [ Small ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [] Nothing buttonText, "button [] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Medium ] Nothing buttonText, "button [ Medium ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Large ] Nothing buttonText, "button [ Large ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Jumbo ] Nothing buttonText, "button [ Jumbo ] Nothing \"" ++ buttonText ++ "\"" )
            ]
          )
        , ( "Composed"
          , [ ( Input.button (buttonAttr [ Primary ]) <|
                    { onPress = Nothing, label = text "button" }
              , """-- This is the longest form for
-- button [ Primary ] Nothing "Button"

Input.button (buttonAttr [ Primary ]) <|
    { onPress = Nothing, label = text "Button" }"""
              )
            , ( el (buttonAttr [ Primary ]) <|
                    text "Button"
              , """-- Is possible to use the button
-- styling also with other elements,
-- for example with "el":

el (buttonAttr [ Primary ]) <|
    text "Button\""""
              )
            , ( el (buttonAttr [ Danger, Outlined, Medium ]) <| text "Button", "el (buttonAttr [ Danger, Outlined, Medium ]) <| text \"Button\"" )
            , ( column (buttonAttr [ Warning ] ++ [ spacing 10 ]) [ text "Row 1", text "Row 2" ], """column (buttonAttr [ Warning ] ++ [ spacing 10 ]) [ text "Row 1", text "Row 2" ]""" )
            , ( column (buttonAttr [ Warning, Waiting ] ++ [ spacing 10 ]) [ text "Row 1", text "Row 2" ], """column (buttonAttr [ Warning, Waiting ] ++ [ spacing 10 ]) [ text "Row 1", text "Row 2" ]""" )
            , ( row (buttonAttr [ Info ] ++ [ spacing 10 ]) [ text "Col 1", text "Col 2" ], """row (buttonAttr [ Info ] ++ [ spacing 10 ]) [ text "Col 1", text "Col 2" ]""" )
            , ( Input.button (buttonAttr [ Primary, Danger ]) <|
                    { onPress = Nothing, label = text "button" }
              , """-- If conflicting modifiers are given,
-- only the last one is taken in consideration

Input.button (buttonAttr [ Primary, Danger ]) <|
    { onPress = Nothing, label = text "button" }"""
              )
            ]
          )
        , ( "Disabled"
          , [ ( button [ Disabled, Muted ] Nothing buttonText, "button [ Disabled, Muted ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Disabled, Primary ] Nothing buttonText, "button [ Disabled, Primary ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Disabled, Success ] Nothing buttonText, "button [ Disabled, Success ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Disabled, Info ] Nothing buttonText, "button [ Disabled, Info ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Disabled, Warning ] Nothing buttonText, "button [ Disabled, Warning ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Disabled, Danger ] Nothing buttonText, "button [ Disabled, Danger ] Nothing \"" ++ buttonText ++ "\"" )
            , ( button [ Disabled ] Nothing buttonText, "button [ Disabled ] Nothing \"" ++ buttonText ++ "\"" )
            ]
          )
        , ( "Button Link"
          , [ ( buttonLink [] "http://example.com" "Button Link", """( buttonLink [ Small ] "http://example.com" "Button Link" """ )
            ]
          )
        , ( "Button Width"
          , [ ( button [] Nothing "Button", """button [] Nothing "Button" """ )
            , ( buttonWidth [] Nothing "ButtonWidth 200" 200, """buttonWidth [] Nothing "ButtonWidth 200" 200""" )
            , ( buttonWidth [] Nothing "ButtonWidth 300" 300, """buttonWidth [] Nothing "ButtonWidth 300" 300""" )
            , ( buttonWidth [] Nothing "ButtonWidth of 200px with very long text" 200, """buttonWidth [] Nothing "ButtonWidth of 200px with very long text" 200""" )
            , ( buttonLinkWidth [] "http://example.com" "ButtonWidthLink 300" 300, """buttonLinkWidth [] "http://example.com" "ButtonWidthLink 300" 300""" )
            ]
          )
        ]
    }


type Size
    = SizeSmall
    | SizeDefault
    | SizeMedium
    | SizeLarge
    | SizeJumbo


type State
    = StateDefault
    | StateOutlined
    | StateLoading
    | StateWaiting
    | StateDisabled


type alias Conf =
    { color : Element.Color
    , size : Size
    , state : State
    }


toPx : Size -> Int
toPx size =
    case size of
        SizeSmall ->
            conf.button.fontSmall

        SizeDefault ->
            conf.button.fontDefault

        SizeMedium ->
            conf.button.fontMedium

        SizeLarge ->
            conf.button.fontLarge

        SizeJumbo ->
            conf.button.fontJumbo


toButtonPadding : Size -> ( Int, Int )
toButtonPadding size =
    case size of
        SizeSmall ->
            ( conf.button.paddingXSmall, conf.button.paddingYSmall )

        SizeDefault ->
            ( conf.button.paddingXDefault, conf.button.paddingYDefault )

        SizeMedium ->
            ( conf.button.paddingXMedium, conf.button.paddingYMedium )

        SizeLarge ->
            ( conf.button.paddingXLarge, conf.button.paddingYLarge )

        SizeJumbo ->
            ( conf.button.paddingXJumbo, conf.button.paddingYJumbo )


processConf : Modifier -> Conf -> Conf
processConf modifier confButton =
    case modifier of
        -- Colors
        Muted ->
            { confButton | color = Framework.ColorNew.muted }

        Primary ->
            { confButton | color = Framework.ColorNew.primary }

        Success ->
            { confButton | color = Framework.ColorNew.success }

        Info ->
            { confButton | color = Framework.ColorNew.info }

        Warning ->
            { confButton | color = Framework.ColorNew.warning }

        Danger ->
            { confButton | color = Framework.ColorNew.danger }

        -- SIZES
        Small ->
            { confButton | size = SizeSmall }

        Medium ->
            { confButton | size = SizeMedium }

        Large ->
            { confButton | size = SizeLarge }

        Jumbo ->
            { confButton | size = SizeJumbo }

        -- STATES
        Outlined ->
            { confButton | state = StateOutlined }

        Loading ->
            { confButton | state = StateLoading }

        Waiting ->
            { confButton | state = StateWaiting }

        Disabled ->
            { confButton | state = StateDisabled }


{-| Generate an Input.button element. Example:

    button [ Medium, Success, Outlined ] Nothing "Button"

-}
button : List Modifier -> Maybe msg -> String -> Element msg
button modifiers onPress label =
    Input.button
        (buttonAttr modifiers)
        { onPress = onPress
        , label = text label
        }


extraAttrForButtonWithCustimazibleWidth : Int -> List (Attribute msg)
extraAttrForButtonWithCustimazibleWidth buttonX =
    [ Element.htmlAttribute (Html.Attributes.style "width" "100%")
    , Element.htmlAttribute (Html.Attributes.style "max-width" (String.fromInt buttonX ++ "px"))
    , Font.center
    , centerX
    ]


{-| -}
buttonWidth : List Modifier -> Maybe msg -> String -> Int -> Element msg
buttonWidth modifiers onPress label width =
    Input.button
        (buttonAttr modifiers
            ++ extraAttrForButtonWithCustimazibleWidth width
        )
        { onPress = onPress
        , label = text label
        }


{-| -}
buttonLink : List Modifier -> String -> String -> Element msg
buttonLink modifiers url label =
    link
        (buttonAttr modifiers)
        { url = url
        , label = text label
        }


{-| -}
buttonLinkWidth : List Modifier -> String -> String -> Int -> Element msg
buttonLinkWidth modifiers url label width =
    link
        (buttonAttr modifiers
            ++ extraAttrForButtonWithCustimazibleWidth width
        )
        { url = url
        , label = text label
        }


{-| -}
buttonCustomizable :
    { width : Int
    , label : String
    , onPress : Maybe msg
    , modifiers : List Modifier
    , extraAttrs : List (Attribute msg)
    }
    -> Element msg
buttonCustomizable { onPress, modifiers, label, width, extraAttrs } =
    Input.button
        (buttonAttr modifiers
            ++ extraAttrForButtonWithCustimazibleWidth width
            ++ extraAttrs
        )
        { onPress = onPress
        , label = text label
        }


colorDefault : Element.Color
colorDefault =
    Framework.ColorNew.white


colorBorderDefault : Element.Color
colorBorderDefault =
    Framework.ColorNew.greyLighter


{-| Generate a list of attributes that can be attached to any element

    row (buttonAttr [ Info ] ++ [ spacing 10 ]) [ text "Col 1", text "Col 2" ]

-}
buttonAttr : List Modifier -> List (Attribute msg)
buttonAttr modifiers =
    let
        confButton =
            List.foldl processConf
                { color = colorDefault
                , size = SizeDefault
                , state = StateDefault
                }
                modifiers

        cc =
            confButton.color

        fontSize =
            toPx confButton.size

        buttonPadding =
            toButtonPadding confButton.size

        backgroundMouseOverColor =
            case confButton.state of
                StateOutlined ->
                    cc

                _ ->
                    backgroundColor
                        |> Framework.ColorNew.lighten 0.8
                        |> Framework.ColorNew.saturate 0.9

        borderMouseOverColor =
            borderColor
                |> Framework.ColorNew.lighten 0.8
                |> Framework.ColorNew.saturate 0.9

        fontMouseOverColor =
            case confButton.state of
                StateLoading ->
                    Framework.ColorNew.transparent

                StateWaiting ->
                    Framework.ColorNew.transparent

                StateOutlined ->
                    Framework.ColorNew.white

                _ ->
                    fontColor
                        |> Framework.ColorNew.lighten 0.8
                        |> Framework.ColorNew.saturate 0.9

        backgroundColor =
            case confButton.state of
                StateDefault ->
                    cc

                StateOutlined ->
                    if confButton.color == Framework.ColorNew.white then
                        colorBorderDefault

                    else
                        Framework.ColorNew.transparent

                StateLoading ->
                    cc

                StateWaiting ->
                    cc

                StateDisabled ->
                    Framework.ColorNew.disabledButtonBackground

        borderRounded =
            case confButton.size of
                SizeSmall ->
                    2

                _ ->
                    3

        borderColor =
            if confButton.color == Framework.ColorNew.white then
                colorBorderDefault

            else
                case confButton.state of
                    StateOutlined ->
                        cc

                    _ ->
                        backgroundColor

        spinnerColor =
            if confButton.color == Framework.ColorNew.white then
                Framework.ColorNew.greyDark

            else
                Framework.ColorNew.white

        fontColor =
            case confButton.state of
                StateOutlined ->
                    cc

                StateLoading ->
                    Framework.ColorNew.transparent

                StateWaiting ->
                    Framework.ColorNew.transparent

                StateDisabled ->
                    Framework.ColorNew.disabledButtonFont

                _ ->
                    if confButton.color == Framework.ColorNew.white then
                        Framework.ColorNew.greyDark

                    else
                        Framework.ColorNew.white

        inFrontAddon =
            case confButton.state of
                StateLoading ->
                    [ inFront
                        (el [ centerY, centerX ] <|
                            Spinner.spinner Spinner.Rotation fontSize spinnerColor
                        )
                    ]

                StateWaiting ->
                    [ inFront
                        (el [ centerY, centerX ] <|
                            Spinner.spinner Spinner.ThreeCircles (fontSize - 4) spinnerColor
                        )
                    ]

                _ ->
                    []
    in
    [ Font.size fontSize
    , Font.color fontColor
    , Background.color backgroundColor
    , paddingXY (Tuple.first buttonPadding) (Tuple.second buttonPadding)
    , Border.rounded borderRounded
    , Border.width 1
    , Border.color borderColor
    ]
        ++ (if confButton.state == StateDisabled then
                [ htmlAttribute <| Html.Attributes.style "cursor" "not-allowed" ]

            else
                [ mouseOver
                    [ Font.color fontMouseOverColor
                    , Background.color backgroundMouseOverColor
                    , Border.color borderMouseOverColor
                    ]
                ]
           )
        ++ inFrontAddon
