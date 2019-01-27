module Framework.ColorNew exposing
    ( orange, yellow, green, blue, purple, red
    , black, blackBis, blackTer, greyDarker, greyDark, grey, greyLight, greyLighter, whiteTer, whiteBis, white
    , primary, info, success, warning, danger, light, dark
    , text, textLight, textStrong, code, codeBackground, pre, preBackground
    , link, linkActive, linkActiveBorder, linkFocus, linkFocusBorder, linkHover, linkHoverBorder, linkInvert, linkVisited
    , background, border, borderHover, muted, disabledButtonBackground, disabledButtonFont
    , toRgba255, toRgbaString, toRgbString, toHexString
    , introspection
    , lighten, luminance, saturate, transparent
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


# CSS String

@docs toRgba255, toRgbaString, toRgbString, toHexString


# Introspection

Used internally to generate the [Style Guide](https://lucamug.github.io/)

@docs introspection

-}

-- import Color

import Element exposing (Element, column)
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
    { name = "ColorsNew"
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
    Element.rgba 255 255 255 0



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
        hslaColor =
            { hue = hue
            , saturation = saturationPercent
            , lightness = lightnessPercent
            , alpha = alpha
            }
    in
    hslaToRgba hslaColor |> Element.fromRgb


{-| -}
hsl : Float -> Float -> Float -> Element.Color
hsl h s l =
    hsla h s l 1.0


{-| Get the hsla representation of a Color
0 - 360 degrees
0% - 100%
0% - 100%
0 - 1.0
-}
toHsla : Element.Color -> { hue : Float, saturation : Float, lightness : Float, alpha : Float }
toHsla =
    Element.toRgb >> rgbaToHsla



-- Conversions


{-| Converts hsla to rgba normalized, which can be used by Element.rgba or Element.fromRgb
-}
hslaToRgba : { hue : Float, saturation : Float, lightness : Float, alpha : Float } -> { red : Float, green : Float, blue : Float, alpha : Float }
hslaToRgba hslaColor =
    let
        hue360 =
            modBy 360 (floor hslaColor.hue) |> toFloat

        saturation =
            clamp 0 100 hslaColor.saturation / 100

        lightness =
            clamp 0 100 hslaColor.lightness / 100

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
    { red = r + lightnessModifier, green = g + lightnessModifier, blue = b + lightnessModifier, alpha = hslaColor.alpha }


rgbaToHsla : { red : Float, green : Float, blue : Float, alpha : Float } -> { hue : Float, saturation : Float, lightness : Float, alpha : Float }
rgbaToHsla rgba =
    let
        r =
            rgba.red

        g =
            rgba.green

        b =
            rgba.blue

        cMax =
            max (max r g) b

        cMin =
            min (min r g) b

        chroma =
            cMax - cMin

        hue =
            if chroma == 0 then
                0

            else
                60
                    * (if cMax == r then
                        (g - b) / chroma

                       else if cMax == g then
                        ((b - r) / chroma) + 2

                       else
                        -- cMax == b
                        (r - g) / chroma + 4
                      )

        lightness =
            (cMax + cMin) / 2

        saturation =
            if lightness == 0 then
                0

            else
                chroma / (1 - abs (2 * lightness - 1))
    in
    { hue =
        if hue < 0 then
            hue + 360

        else
            hue
    , saturation = saturation * 100
    , lightness = lightness * 100
    , alpha = rgba.alpha
    }



{-
    ██████╗███████╗███████╗
   ██╔════╝██╔════╝██╔════╝
   ██║     ███████╗███████╗
   ██║     ╚════██║╚════██║
   ╚██████╗███████║███████║
    ╚═════╝╚══════╝╚══════╝
-}


{-| -}
toRgba255 : Element.Color -> { red : Int, green : Int, blue : Int, alpha : Float }
toRgba255 color =
    let
        r =
            Element.toRgb color
    in
    { red = round r.red, green = round r.green, blue = round r.blue, alpha = r.alpha }


{-| -}
toRgbaString : Element.Color -> String
toRgbaString color =
    "rgba("
        ++ (toRgba255 color
                |> (\rgba255 ->
                        List.map String.fromInt [ rgba255.red, rgba255.green, rgba255.blue ]
                            ++ [ String.fromFloat rgba255.alpha ]
                            |> String.join ","
                   )
           )
        ++ ")"


{-| -}
toRgbString : Element.Color -> String
toRgbString color =
    "rgb("
        ++ (toRgba255 color
                |> (\rgba255 -> List.map String.fromInt [ rgba255.red, rgba255.green, rgba255.blue ])
                |> String.join ","
           )
        ++ ")"


{-| -}
toHexString : Element.Color -> String
toHexString color =
    toRgba255 color
        |> (\rgba255 ->
                List.map toHex [ rgba255.red, rgba255.green, rgba255.blue ]
                    |> (::) "#"
                    |> String.join ""
           )


toHex : Int -> String
toHex =
    toRadix >> String.padLeft 2 '0'


toRadix : Int -> String
toRadix n =
    let
        getChar c =
            if c < 10 then
                String.fromInt c

            else
                String.fromChar <| Char.fromCode (87 + c)
    in
    if n < 16 then
        getChar n

    else
        toRadix (n // 16) ++ getChar (remainderBy 16 n)


toHslaString : Element.Color -> String
toHslaString color =
    let
        c =
            toHsla color
    in
    "hsla(" ++ String.fromFloat c.hue ++ "," ++ String.fromFloat c.saturation ++ "%," ++ String.fromFloat c.lightness ++ "%," ++ String.fromFloat c.alpha ++ ")"


toHslString : Element.Color -> String
toHslString color =
    let
        c =
            toHsla color
    in
    "hsl(" ++ String.fromFloat c.hue ++ "," ++ String.fromFloat c.saturation ++ "%," ++ String.fromFloat c.lightness ++ "%)"


{-| Luminance calculation adopted from <https://www.w3.org/TR/WCAG20-TECHS/G17.html>
Luminance describes the perceived brightness of a color.
To guarantee a readable shade of text, we need to look at the luminance of a color.
If the luminance is > 0.55, use black text. Else, white.
<https://bulma.io/documentation/overview/functions/#the-code-findcolorinvert-code-function>
For colors very close to the threshold, either color is OK.

Note to self... this calculation is different from the Bulma calculations, but consistent with <https://planetcalc.com/7779/>

-}
luminance : Element.Color -> Float
luminance color =
    let
        sRgb channel =
            if channel <= 0.03928 then
                channel / 12.92

            else
                ((channel + 0.055) / 1.055) ^ 2.4

        rgbaColor =
            Element.toRgb color

        r =
            sRgb rgbaColor.red

        g =
            sRgb rgbaColor.green

        b =
            sRgb rgbaColor.blue
    in
    (0.2126 * r) + (0.7152 * g) + (0.0722 * b)



-- toHsl
-- toHsla
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
{-
   ███╗   ███╗ █████╗ ███╗   ██╗██╗██████╗ ██╗   ██╗██╗      █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
   ████╗ ████║██╔══██╗████╗  ██║██║██╔══██╗██║   ██║██║     ██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
   ██╔████╔██║███████║██╔██╗ ██║██║██████╔╝██║   ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║
   ██║╚██╔╝██║██╔══██║██║╚██╗██║██║██╔═══╝ ██║   ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
   ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║██║     ╚██████╔╝███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
-}
-- #############################
-- ## From Color Manipulation ##
-- #############################
-- Totally incomplete...?


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
