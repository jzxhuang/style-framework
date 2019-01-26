module Framework.ColorNew exposing
    ( orange, yellow, green, blue, purple, red
    , black, blackBis, blackTer, greyDarker, greyDark, grey, greyLight, greyLighter, whiteTer, whiteBis, white
    , primary, info, success, warning, danger, light, dark
    , text, textLight, textStrong, code, codeBackground, pre, preBackground
    , link, linkActive, linkActiveBorder, linkFocus, linkFocusBorder, linkHover, linkHoverBorder, linkInvert, linkVisited
    , background, border, borderHover, muted, disabledButtonBackground, disabledButtonFont
    , introspection
    , lighten, saturate, transparent
    )

{-| [Demo](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Colors/Colors)

[![Cards](https://lucamug.github.io/style-framework/images/demos/colors.png)](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Colors/Colors)

Colors are inspired by the Bulma framework: <https://bulma.io/documentation/overview/variables/>


# Colors

@docs orange, yellow, green, blue, purple, red


# Grey Scale

[Demo](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Colors/Grey%20Scale)

@docs black, blackBis, blackTer, greyDarker, greyDark, grey, greyLight, greyLighter, whiteTer, whiteBis, white


# Derived

[Demo](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Colors/Derived)

@docs primary, info, success, warning, danger, light, dark


# Fonts

[Demo](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Colors/Fonts)

@docs text, textLight, textStrong, code, codeBackground, pre, preBackground


# Links

[Demo](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Colors/Links)

@docs link, linkActive, linkActiveBorder, linkFocus, linkFocusBorder, linkHover, linkHoverBorder, linkInvert, linkVisited


# Others

[Demo](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Colors/Others)

@docs background, border, borderHover, muted, disabledButtonBackground, disabledButtonFont


# Introspection

Used internally to generate the [Style Guide](https://lucamug.github.io/)

@docs introspection

-}

-- import Color

import Element exposing (Element, column, rgba)
import Element.Background
import Element.Border
import Element.Font
import Framework.ConfigurationNew exposing (colors)


{-| -}
introspection :
    { name : String
    , description : String
    , signature : String
    , variations : List ( String, List ( Element msg1, String ) )
    }
introspection =
    { name = "Colors"
    , description = ""
    , signature = "Element.Color"
    , variations =
        [ ( "Colors"
          , [ ( usageWrapper <| orange, "orange" )
            , ( usageWrapper <| yellow, "yellow" )
            , ( usageWrapper <| green, "green" )
            , ( usageWrapper <| blue, "blue" )
            , ( usageWrapper <| purple, "purple" )
            , ( usageWrapper <| red, "red" )
            ]
          )
        , ( "Grey Scale"
          , [ ( usageWrapper <| black, "black" )
            , ( usageWrapper <| blackBis, "blackBis" )
            , ( usageWrapper <| blackTer, "blackTer" )
            , ( usageWrapper <| greyDarker, "greyDarker" )
            , ( usageWrapper <| greyDark, "greyDark" )
            , ( usageWrapper <| grey, "grey" )
            , ( usageWrapper <| greyLight, "greyLight" )
            , ( usageWrapper <| greyLighter, "greyLighter" )
            , ( usageWrapper <| whiteTer, "whiteTer" )
            , ( usageWrapper <| whiteBis, "whiteBis" )
            , ( usageWrapper <| white, "white" )
            ]
          )
        , ( "Derived"
          , [ ( usageWrapper <| primary, "primary" )
            , ( usageWrapper <| info, "info" )
            , ( usageWrapper <| success, "success" )
            , ( usageWrapper <| warning, "warning" )
            , ( usageWrapper <| danger, "danger" )
            , ( usageWrapper <| light, "light" )
            , ( usageWrapper <| dark, "dark" )
            ]
          )
        , ( "Fonts"
          , [ ( usageWrapper <| text, "text" )
            , ( usageWrapper <| textLight, "textLight" )
            , ( usageWrapper <| textStrong, "textStrong" )
            , ( usageWrapper <| code, "code" )
            , ( usageWrapper <| codeBackground, "codeBackground" )
            , ( usageWrapper <| pre, "pre" )
            , ( usageWrapper <| preBackground, "preBackground" )
            ]
          )
        , ( "Links"
          , [ ( usageWrapper <| link, "link" )
            , ( usageWrapper <| linkInvert, "linkInvert" )
            , ( usageWrapper <| linkVisited, "linkVisited" )
            , ( usageWrapper <| linkHover, "linkHover" )
            , ( usageWrapper <| linkHoverBorder, "linkHoverBorder" )
            , ( usageWrapper <| linkFocus, "linkFocus" )
            , ( usageWrapper <| linkFocusBorder, "linkFocusBorder" )
            , ( usageWrapper <| linkActive, "linkActive" )
            , ( usageWrapper <| linkActiveBorder, "linkActiveBorder" )
            ]
          )
        , ( "Others"
          , [ -- Background
              ( usageWrapper <| background, "background" )

            -- Border
            , ( usageWrapper <| border, "border" )
            , ( usageWrapper <| borderHover, "borderHover" )

            -- Others
            , ( usageWrapper <| muted, "muted" )
            , ( usageWrapper <| disabledButtonBackground, "disabledButtonBackground" )
            , ( usageWrapper <| disabledButtonFont, "disabledButtonFont" )
            ]
          )
        ]
    }


{-| -}
usageWrapper : Element.Color -> Element msg
usageWrapper cl =
    Element.el
        [ Element.Background.color cl
        , Element.width <| Element.px 200
        , Element.padding 10
        , Element.Border.rounded 5

        -- , Element.Font.color <| Color.toElementColor <| Color.maximumContrast cl (Color.rgb 0 0 0) (Color.rgb 255 255 255)
        , Element.Font.color <| Element.rgb255 0 0 0
        ]
    <|
        column []
            [ --Element.text <| Color.colorToHex cl
              Element.text ""
            ]



{-
   ██████╗ ██████╗ ███████╗███████╗███████╗████████╗
   ██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝
   ██████╔╝██████╔╝█████╗  ███████╗█████╗     ██║
   ██╔═══╝ ██╔══██╗██╔══╝  ╚════██║██╔══╝     ██║
   ██║     ██║  ██║███████╗███████║███████╗   ██║
   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝   ╚═╝
-}
-- Contextual


{-| -}
primary : Element.Color
primary =
    colors.primary


{-| -}
success : Element.Color
success =
    colors.success


{-| -}
danger : Element.Color
danger =
    colors.danger


{-| -}
warning : Element.Color
warning =
    colors.warning


{-| -}
info : Element.Color
info =
    colors.info


{-| -}
light : Element.Color
light =
    colors.light


{-| -}
dark : Element.Color
dark =
    colors.dark



-- Basic


{-| -}
black : Element.Color
black =
    colors.black


{-| -}
white : Element.Color
white =
    colors.white


{-| -}
grey : Element.Color
grey =
    colors.grey


{-| -}
red : Element.Color
red =
    colors.red


{-| -}
orange : Element.Color
orange =
    colors.orange


{-| -}
yellow : Element.Color
yellow =
    colors.yellow


{-| -}
green : Element.Color
green =
    colors.green


{-| -}
blue : Element.Color
blue =
    colors.blue


{-| -}
purple : Element.Color
purple =
    colors.purple


{-| -}
pink : Element.Color
pink =
    colors.pink


{-| -}
brown : Element.Color
brown =
    colors.brown



-- Grey Scale


{-| -}
blackBis : Element.Color
blackBis =
    colors.blackBis


{-| -}
blackTer : Element.Color
blackTer =
    colors.blackTer


{-| -}
greyDarker : Element.Color
greyDarker =
    colors.greyDarker


{-| -}
greyDark : Element.Color
greyDark =
    colors.greyDark


{-| -}
greyLight : Element.Color
greyLight =
    colors.greyLight


{-| -}
greyLighter : Element.Color
greyLighter =
    colors.greyLighter


{-| -}
whiteTer : Element.Color
whiteTer =
    colors.whiteTer


{-| -}
whiteBis : Element.Color
whiteBis =
    colors.whiteBis



-- Other (not initial variable)


{-| -}
background : Element.Color
background =
    colors.whiteTer


{-| -}
border : Element.Color
border =
    colors.greyLighter


{-| -}
borderHover : Element.Color
borderHover =
    colors.greyLight


{-| -}
code : Element.Color
code =
    colors.red


{-| -}
codeBackground : Element.Color
codeBackground =
    colors.whiteTer


{-| -}
link : Element.Color
link =
    colors.blue


{-| -}
linkActive : Element.Color
linkActive =
    colors.greyDarker


{-| -}
linkActiveBorder : Element.Color
linkActiveBorder =
    colors.greyDark


{-| -}
linkFocus : Element.Color
linkFocus =
    colors.greyDarker


{-| -}
linkFocusBorder : Element.Color
linkFocusBorder =
    colors.blue


{-| -}
linkHover : Element.Color
linkHover =
    colors.greyDarker


{-| -}
linkHoverBorder : Element.Color
linkHoverBorder =
    colors.greyLight


{-| -}
linkInvert : Element.Color
linkInvert =
    colors.grey



-- todo: blue-invert


{-| -}
linkVisited : Element.Color
linkVisited =
    colors.purple


{-| -}
muted : Element.Color
muted =
    colors.greyLight


{-| -}
pre : Element.Color
pre =
    colors.greyDark


{-| -}
preBackground : Element.Color
preBackground =
    colors.whiteTer


{-| -}
text : Element.Color
text =
    colors.greyDark


{-| -}
textLight : Element.Color
textLight =
    colors.grey


{-| -}
textStrong : Element.Color
textStrong =
    colors.greyDarker


{-| -}
disabledButtonBackground : Element.Color
disabledButtonBackground =
    colors.greyLighter


{-| -}
disabledButtonFont : Element.Color
disabledButtonFont =
    colors.greyLight


{-| -}
transparent : Element.Color
transparent =
    rgba 255 255 255 0



{-
    ██████╗██████╗ ███████╗ █████╗ ████████╗███████╗
   ██╔════╝██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝
   ██║     ██████╔╝█████╗  ███████║   ██║   █████╗
   ██║     ██╔══██╗██╔══╝  ██╔══██║   ██║   ██╔══╝
   ╚██████╗██║  ██║███████╗██║  ██║   ██║   ███████╗
    ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
-}


{-| Adapted from <https://package.elm-lang.org/packages/tesk9/palette/latest>

Hue from 0 to 360 (wiill mod by 360)
Saturation in percent, will be clamped between 0 - 100
Lightness in percent, will be clamped between 0 - 100

-}
hsla : Float -> Float -> Float -> Float -> Element.Color
hsla hue saturationPercent lightnessPercent alpha =
    let
        hue360 =
            modBy 360 (floor hue) |> toFloat

        saturation =
            clamp 0 100 saturationPercent / 100

        lightness =
            clamp 0 100 lightnessPercent / 100

        chroma =
            (1 - abs (2 * lightness - 1)) * saturation

        lightnessModifier =
            lightness - chroma / 2

        hueIsBetween lowerBound upperBound =
            lowerBound <= hue360 && hue360 <= upperBound

        zigUp xIntercept =
            chroma * (hue360 - xIntercept) / 60

        zigDown xIntercept =
            -1 * zigUp xIntercept

        ( r, g, b ) =
            if hueIsBetween 0 60 then
                ( chroma, zigUp 0, 0 )

            else if hueIsBetween 60 120 then
                ( zigDown 120, chroma, 0 )

            else if hueIsBetween 120 180 then
                ( 0, chroma, zigUp 120 )

            else if hueIsBetween 180 240 then
                ( 0, zigDown 240, chroma )

            else if hueIsBetween 240 300 then
                ( zigUp 240, 0, chroma )

            else
                ( chroma, 0, zigDown 360 )
    in
    rgba (r + lightnessModifier) (g + lightnessModifier) (b + lightnessModifier) alpha


{-| -}
hsl : Float -> Float -> Float -> Element.Color
hsl h s l =
    hsla h s l 1.0



-- toCssString
-- From hex?
{-
   hex : Hex -> Hex -> Hex -> Hex -> Hex -> Hex -> Element.Color
   hex h1 h2 h3 h4 h5 h6 =
       ...

   type Hex
       = 0
       | 1
       |...
       | D
       | E
       | F

   hexToString : Hex -> String
-}
-- #############################
-- ## From Color Manipulation ##
-- #############################
-- Totally incomplete?


{-| -}
saturate : Float -> Element.Color -> Element.Color
saturate quantity color =
    color


{-| -}
lighten : Float -> Element.Color -> Element.Color
lighten quantity color =
    color



-- maximumContrast c dark_ light_ =
--     -- From https://stackoverflow.com/questions/3942878/how-to-decide-font-color-in-white-or-black-depending-on-background-color
--     if intensity c < 186 then
--         light_
--     else
--         dark_
-- intensity : Element.Color -> Float
-- intensity c =
--     -- From https://stackoverflow.com/questions/3942878/how-to-decide-font-color-in-white-or-black-depending-on-background-color
--     let
--         c2 =
--             toRgb c
--     in
--     -- From https://stackoverflow.com/questions/3942878/how-to-decide-font-color-in-white-or-black-depending-on-background-color
--     toFloat c2.red * 0.299 + toFloat c2.green * 0.587 + toFloat c2.blue * 0.114
-- #############################
-- ##                         ##
-- #############################
