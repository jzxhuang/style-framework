module Main exposing (main)

import Element exposing (..)
import Element.Background
import Element.Input exposing (button)
import Framework.ColorNew as ColorNew
import Framework.ConfigurationNew as Configuration
import Framework.ModifierNew exposing (Modifier(..), toButtonAttr)
import Html


main : Html.Html a
main =
    layout [] <|
        column [ centerX, centerY, spacing 15 ]
            [ row [ spacing 5 ]
                [ button (toButtonAttr Nothing []) { onPress = Nothing, label = text "Default" }
                , button (toButtonAttr Nothing [ Primary ]) { onPress = Nothing, label = text "Primary" }
                , button (toButtonAttr Nothing [ Success ]) { onPress = Nothing, label = text "Success" }
                , button (toButtonAttr Nothing [ Info ]) { onPress = Nothing, label = text "Info" }
                , button (toButtonAttr Nothing [ Warning ]) { onPress = Nothing, label = text "Warning" }
                , button (toButtonAttr Nothing [ Danger ]) { onPress = Nothing, label = text "Danger" }
                ]
            , row [ spacing 5 ]
                [ button (toButtonAttr Nothing [ Outlined ]) { onPress = Nothing, label = text "Button" }
                , button (toButtonAttr Nothing [ Outlined, Primary ]) { onPress = Nothing, label = text "Primary" }
                , button (toButtonAttr Nothing [ Outlined, Success ]) { onPress = Nothing, label = text "Success" }
                , button (toButtonAttr Nothing [ Outlined, Info ]) { onPress = Nothing, label = text "Info" }
                , button (toButtonAttr Nothing [ Outlined, Warning ]) { onPress = Nothing, label = text "Warning" }
                , button (toButtonAttr Nothing [ Outlined, Danger ]) { onPress = Nothing, label = text "Danger" }
                ]
            , row [ spacing 5 ]
                [ button (toButtonAttr Nothing [ Small ]) { onPress = Nothing, label = text "Small" }
                , button (toButtonAttr Nothing []) { onPress = Nothing, label = text "Default" }
                , button (toButtonAttr Nothing [ Large ]) { onPress = Nothing, label = text "Large" }
                , button (toButtonAttr Nothing [ Jumbo ]) { onPress = Nothing, label = text "Jumbo" }
                ]
            , row [ spacing 5 ]
                [ button (toButtonAttr Nothing [ Disabled ]) { onPress = Nothing, label = text "Button" }
                , button (toButtonAttr Nothing [ Disabled, Primary ]) { onPress = Nothing, label = text "Primary" }
                , button (toButtonAttr Nothing [ Disabled, Success ]) { onPress = Nothing, label = text "Success" }
                , button (toButtonAttr Nothing [ Disabled, Info ]) { onPress = Nothing, label = text "Info" }
                , button (toButtonAttr Nothing [ Disabled, Warning ]) { onPress = Nothing, label = text "Warning" }
                , button (toButtonAttr Nothing [ Disabled, Danger ]) { onPress = Nothing, label = text "Danger" }
                ]
            , row [ spacing 5 ]
                [ button (toButtonAttr Nothing [ Loading ]) { onPress = Nothing, label = text "Button" }
                , button (toButtonAttr Nothing [ Loading, Primary ]) { onPress = Nothing, label = text "Primary" }
                , button (toButtonAttr Nothing [ Loading, Success ]) { onPress = Nothing, label = text "Success" }
                , button (toButtonAttr Nothing [ Loading, Info ]) { onPress = Nothing, label = text "Info" }
                , button (toButtonAttr Nothing [ Loading, Warning ]) { onPress = Nothing, label = text "Warning" }
                , button (toButtonAttr Nothing [ Loading, Danger ]) { onPress = Nothing, label = text "Danger" }
                ]
            ]
