module Framework.ConfigurationNew exposing (configuration, colors)

{-| List of values that you can change to costumize the aspect of the framwork

This list is inspired by Bulma framework: <https://bulma.io/documentation/overview/variables/>


# Functions

@docs configuration, colors

-}

import Dict
import Element exposing (Color, rgb, rgba, rgba255)
import Element.Font as Font
import MyStyle



-- Type definitions


{-| -}
colors :
    { -- Contextual
      primary : Color
    , success : Color
    , danger : Color
    , warning : Color
    , info : Color
    , light : Color
    , dark : Color

    -- Basic
    , black : Color
    , white : Color
    , grey : Color
    , red : Color
    , orange : Color
    , yellow : Color
    , green : Color
    , blue : Color
    , purple : Color
    , brown : Color
    , pink : Color

    -- Grey Scale
    , blackBis : Color
    , blackTer : Color
    , greyDarker : Color
    , greyDark : Color
    , greyLight : Color
    , greyLighter : Color
    , whiteTer : Color
    , whiteBis : Color
    }
colors =
    { -- Contextual
      primary = rgba255 0 209 178 1.0
    , success = rgba255 35 209 96 1.0
    , danger = rgba255 255 56 96 1.0
    , warning = rgba255 255 221 87 1.0
    , info = rgba255 32 156 238 1.0
    , light = rgba255 245 245 245 1.0
    , dark = rgba255 54 54 54 1.0

    -- Basic
    , black = rgba255 0 0 0 1.0
    , white = rgba255 255 255 255 1.0
    , grey = rgba255 128 128 128 1.0
    , red = rgba255 255 0 0 1.0
    , orange = rgba255 255 165 0 1.0
    , yellow = rgba255 255 255 0 1.0
    , green = rgba255 0 128 0 1.0
    , blue = rgba255 0 0 255 1.0
    , purple = rgba255 128 0 128 1.0
    , brown = rgba255 165 42 42 1.0
    , pink = rgba255 255 192 203 1.0

    -- Grey Scale
    , blackBis = rgba255 18 18 18 1.0
    , blackTer = rgba255 36 36 36 1.0
    , greyDarker = rgba255 54 54 54 1.0
    , greyDark = rgba255 74 74 74 1.0
    , greyLight = rgba255 181 181 181 1.0
    , greyLighter = rgba255 219 219 219 1.0
    , whiteTer = rgba255 245 245 245 1.0
    , whiteBis = rgba255 250 250 250 1.0
    }


type alias ConfigColors =
    { -- Contextual
      primary : Color
    , success : Color
    , danger : Color
    , warning : Color
    , info : Color
    , light : Color
    , dark : Color

    -- Basic
    , black : Color
    , white : Color
    , grey : Color
    , red : Color
    , orange : Color
    , yellow : Color
    , green : Color
    , blue : Color
    , purple : Color
    , brown : Color
    , pink : Color

    -- Grey Scale
    , blackBis : Color
    , blackTer : Color
    , greyDarker : Color
    , greyDark : Color
    , greyLight : Color
    , greyLighter : Color
    , whiteTer : Color
    , whiteBis : Color

    -- Other
    , background : Color
    , border : Color
    , border_hover : Color
    , code : Color
    , code_background : Color
    , link : Color
    , link_active : Color
    , link_active_border : Color
    , link_focus : Color
    , link_focus_border : Color
    , link_hover : Color
    , link_hover_border : Color
    , link_invert : Color
    , link_visited : Color
    , muted : Color
    , pre : Color
    , pre_background : Color
    , text : Color
    , text_light : Color
    , text_strong : Color

    -- , transparent : Element.Color
    }


type alias ConfigButtons =
    { fontSmall : Int
    , fontDefault : Int
    , fontMedium : Int
    , fontLarge : Int
    , fontJumbo : Int
    , paddingXSmall : Int
    , paddingYSmall : Int
    , paddingXDefault : Int
    , paddingYDefault : Int
    , paddingXMedium : Int
    , paddingYMedium : Int
    , paddingXLarge : Int
    , paddingYLarge : Int
    , paddingXJumbo : Int
    , paddingYJumbo : Int
    }


type alias ConfigFonts =
    { typeface : String
    , typefaceFallback : Font.Font
    , url : String
    }


type alias ConfigSizes =
    { size1 : Float
    , size2 : Float
    , size3 : Float
    , size4 : Float
    , size5 : Float
    , size6 : Float
    , size7 : Float
    }


type alias ConfigMoveDownPlaceholder =
    { large : Float, small : Float }


configuration : { color : ConfigColors, font : ConfigFonts, button : ConfigButtons, size : ConfigSizes, moveDownPlaceholder : ConfigMoveDownPlaceholder }
configuration =
    { size =
        { size1 = getFloat "size1"
        , size2 = getFloat "size2"
        , size3 = getFloat "size3"
        , size4 = getFloat "size4"
        , size5 = getFloat "size5"
        , size6 = getFloat "size6"
        , size7 = getFloat "size7"
        }
    , color =
        { -- Contextual
          primary = colors.primary
        , success = colors.success
        , danger = colors.danger
        , warning = colors.warning
        , info = colors.info
        , light = colors.light
        , dark = colors.dark

        -- Basic
        , black = colors.black
        , white = colors.white
        , grey = colors.grey
        , red = colors.red
        , orange = colors.orange
        , yellow = colors.yellow
        , green = colors.green
        , blue = colors.blue
        , purple = colors.purple
        , brown = colors.brown
        , pink = colors.pink

        -- Grey Scale
        , blackBis = colors.blackBis
        , blackTer = colors.blackTer
        , greyDarker = colors.greyDarker
        , greyDark = colors.greyDark
        , greyLight = colors.greyLight
        , greyLighter = colors.greyLighter
        , whiteTer = colors.whiteTer
        , whiteBis = colors.whiteBis

        -- Other
        , background = colors.whiteTer
        , border = colors.greyLighter
        , border_hover = colors.greyLight
        , code = colors.red
        , code_background = colors.whiteTer
        , link = colors.blue
        , link_active = colors.greyDarker
        , link_active_border = colors.greyDark
        , link_focus = colors.greyDarker
        , link_focus_border = colors.blue
        , link_hover = colors.greyDarker
        , link_hover_border = colors.greyLight
        , link_invert = colors.blue
        , link_visited = colors.purple
        , muted = colors.greyLight
        , pre = colors.greyDark
        , pre_background = colors.whiteTer
        , text = colors.greyDark
        , text_light = colors.grey
        , text_strong = colors.greyDarker

        -- , transparent = colors.
        }
    , moveDownPlaceholder =
        { large = getFloat "moveDownPlaceHolderLarge"
        , small = getFloat "moveDownPlaceHolderSmall"
        }
    , font =
        { url = getString "font_url"
        , typeface = getString "font_typeface"
        , typefaceFallback = getTypeface "font_typeface_fallback"
        }
    , button =
        { fontSmall = getInt "buttonFontSmall"
        , fontDefault = getInt "buttonFontDefault"
        , fontMedium = getInt "buttonFontMedium"
        , fontLarge = getInt "buttonFontLarge"
        , fontJumbo = getInt "buttonFontJumbo"
        , paddingXSmall = getInt "buttonPaddingXSmall"
        , paddingYSmall = getInt "buttonPaddingYSmall"
        , paddingXDefault = getInt "buttonPaddingXDefault"
        , paddingYDefault = getInt "buttonPaddingYDefault"
        , paddingXMedium = getInt "buttonPaddingXMedium"
        , paddingYMedium = getInt "buttonPaddingYMedium"
        , paddingXLarge = getInt "buttonPaddingXLarge"
        , paddingYLarge = getInt "buttonPaddingYLarge"
        , paddingXJumbo = getInt "buttonPaddingXJumbo"
        , paddingYJumbo = getInt "buttonPaddingYJumbo"
        }
    }


{-| -}
getTypeface : String -> Font.Font
getTypeface key =
    let
        value =
            getString key
    in
    if value == "sans-serif" then
        Font.sansSerif

    else if value == "monospace" then
        Font.monospace

    else if value == "cursive" then
        -- Font.cursive (still not implemented)
        Font.serif

    else
        Font.serif


getString : String -> String
getString key =
    Maybe.withDefault "" (getValue key configuration_ MyStyle.configuration)


getFloat : String -> Float
getFloat key =
    case String.toFloat <| getString key of
        Just value2 ->
            value2

        Nothing ->
            0


getInt : String -> Int
getInt key =
    round <| getFloat key



{-
   getInt : String -> Int
   getInt key =
       round <| getFloat key
-}
{-

   hexToColor : String -> Color.Color
   hexToColor hex =
       let
           newHex =
               if String.length hex == 6 || String.length hex == 7 then
                   hex ++ "ff"

               else if String.length hex == 3 || String.length hex == 4 then
                   hex ++ "f"

               else
                   hex
       in
       case ColorMath.Hex8.toColor <| newHex of
           Ok value ->
               value

           Err _ ->
               Color.rgb 0x00 0x00 0x00
-}


getValue :
    comparable
    -> Dict.Dict comparable a
    -> Dict.Dict comparable a
    -> Maybe a
getValue key original replacement =
    let
        repl =
            Dict.get key replacement

        orig =
            Dict.get key original
    in
    case repl of
        Just value ->
            Just value

        Nothing ->
            case orig of
                Just value ->
                    Just value

                Nothing ->
                    Nothing


bulmaSizes :
    { size1 : String
    , size2 : String
    , size3 : String
    , size5 : String
    , size6 : String
    , size7 : String
    , size4 : String
    }
bulmaSizes =
    { size1 = "3.00"
    , size2 = "2.50"
    , size3 = "2.00"
    , size4 = "1.50"
    , size5 = "1.25"
    , size6 = "1.00"
    , size7 = "0.75"
    }


findColorInvert : String -> String
findColorInvert color =
    {- 019
       color
           |> hexToColor
           |> Color.complement
           -- |> ColorMath.Scaling.rotateHue 0.5
           |> ColorMath.Hex8.fromColor
    -}
    "#000000"


configuration_ : Dict.Dict String String
configuration_ =
    Dict.fromList
        [ -- Fonts
          --, ( "family-sans-serif", "BlinkMacSystemFont, -apple-system, \"Segoe UI\", \"Roboto\", \"Oxygen\", \"Ubuntu\", \"Cantarell\", \"Fira Sans\", \"Droid Sans\", \"Helvetica Neue\", \"Helvetica\", \"Arial\", sans-serif" )
          --, ( "family-monospace", "monospace" )
          --, ( "render-mode", "optimizeLegibility" )
          --
          ( "font_url", "https://fonts.googleapis.com/css?family=Noto+Sans" )
        , ( "font_typeface", "Noto Sans" )
        , ( "font_typeface_fallback", "sans-serif" )

        -- Sizes
        , ( "size1", bulmaSizes.size1 )
        , ( "size2", bulmaSizes.size2 )
        , ( "size3", bulmaSizes.size3 )
        , ( "size4", bulmaSizes.size4 )
        , ( "size5", bulmaSizes.size5 )
        , ( "size6", bulmaSizes.size6 )
        , ( "size7", bulmaSizes.size7 )

        -- Misc
        --, ( "weight-light", "300" )
        --, ( "weight-normal", "400" )
        --, ( "weight-medium", "500" )
        --, ( "weight-semibold", "600" )
        --, ( "weight-bold", "700" )
        --, ( "gap", "32px" )
        --, ( "tablet", "769px" )
        --, ( "desktop", "960px + (2 * $gap)" )
        --, ( "widescreen", "1152px + (2 * $gap)" )
        --, ( "widescreen-enabled", "true" )
        --, ( "fullhd", "1344px + (2 * $gap)" )
        --, ( "fullhd-enabled", "true" )
        --, ( "easing", "ease-out" )
        --, ( "radius-small", "2px" )
        --, ( "radius", "3px" )
        --, ( "radius-large", "5px" )
        --, ( "radius-rounded", "290486px" )
        --, ( "speed", "86ms" )
        --, ( "variable-columns", "true" )
        -- Family
        --, ( "family-primary", bulmaColor.family_sans_serif )
        --, ( "family-code", bulmaColor.family_monospace )
        -- Sizes
        , ( "size_small", bulmaSizes.size7 )
        , ( "size_normal", bulmaSizes.size6 )
        , ( "size_medium", bulmaSizes.size5 )
        , ( "size_large", bulmaSizes.size4 )

        -- OTHERS
        -- Position of the Placeholder
        , ( "moveDownPlaceHolderLarge", "31" )
        , ( "moveDownPlaceHolderSmall", "30" )

        -- Transparent
        , ( "transparent", "#ffffff00" )

        -- Button
        , ( "buttonFontSmall", "12" )
        , ( "buttonFontDefault", "16" )
        , ( "buttonFontMedium", "20" )
        , ( "buttonFontLarge", "24" )
        , ( "buttonFontJumbo", "16" )
        , ( "buttonPaddingXSmall", "9" )
        , ( "buttonPaddingYSmall", "3" )
        , ( "buttonPaddingXDefault", "12" )
        , ( "buttonPaddingYDefault", "5" )
        , ( "buttonPaddingXMedium", "15" )
        , ( "buttonPaddingYMedium", "7" )
        , ( "buttonPaddingXLarge", "18" )
        , ( "buttonPaddingYLarge", "9" )
        , ( "buttonPaddingXJumbo", "24" )
        , ( "buttonPaddingYJumbo", "24" )
        ]
