module Framework.ConfigurationNew exposing
    ( default
    , Configuration
    )

{-| List of values that you can change to costumize the aspect of the framwork

This list is inspired by Bulma framework: <https://bulma.io/documentation/overview/variables/>


# Functions

@docs default, colors

-}

import Dict
import Element exposing (Color, rgb, rgba, rgba255)
import Element.Font as Font
import MyStyle



-- Type definitions


{-| -}
type alias Configuration =
    { color : Colors
    , font : Fonts
    , button : Buttons
    }



-- This is the only place where colors are defined by their rgba values. All other colors are derived from here.
-- i.e. configuration.button.colorDefault.background = colors.white, muted = colors.greyLight, etc.


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
    , transparent : Color
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
    -- The luminance threshold - see the function findIdealTextColor for my details
    , luminanceThreshold : Float
    }
colors =
    { -- Contextual - from Bulma
      primary = rgba255 0 209 178 1.0
    , success = rgba255 35 209 96 1.0
    , danger = rgba255 255 56 96 1.0
    , warning = rgba255 255 221 87 1.0
    , info = rgba255 32 156 238 1.0
    , light = rgba255 245 245 245 1.0
    , dark = rgba255 54 54 54 1.0

    -- Basic: The following definitions are the standard colors from the HTML spec.
    , black = rgba255 0 0 0 1.0
    , white = rgba255 255 255 255 1.0
    , transparent = rgba255 0 0 0 0
    , grey = rgba255 128 128 128 1.0
    , red = rgba255 255 0 0 1.0
    , orange = rgba255 255 165 0 1.0
    , yellow = rgba255 255 255 0 1.0
    , green = rgba255 0 128 0 1.0
    , blue = rgba255 0 0 255 1.0
    , purple = rgba255 128 0 128 1.0
    , brown = rgba255 165 42 42 1.0
    , pink = rgba255 255 192 203 1.0

    -- Grey Scale: inspired by Bulma
    , blackBis = rgba255 18 18 18 1.0
    , blackTer = rgba255 36 36 36 1.0
    , greyDarker = rgba255 54 54 54 1.0
    , greyDark = rgba255 74 74 74 1.0
    , greyLight = rgba255 181 181 181 1.0
    , greyLighter = rgba255 219 219 219 1.0
    , whiteTer = rgba255 245 245 245 1.0
    , whiteBis = rgba255 250 250 250 1.0

    -- Other
    , luminanceThreshold = 0.55
    }


type alias Colors =
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
    , transparent : Color
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
    , textLight : Color
    , textDark : Color

    -- , transparent : Element.Color
    , luminanceThreshold : Float
    }


type alias Buttons =
    { paddingSmall : { x : Int, y : Int }
    , paddingDefault : { x : Int, y : Int }
    , paddingLarge : { x : Int, y : Int }
    , paddingJumbo : { x : Int, y : Int }
    , defaultColorBackground : Color
    , defaultColorBorder : Color

    -- The number of lightness points (hsla) that the button will change by on hover
    , hoverColorDelta : Float
    }


type alias Fonts =
    { typeface : String
    , typefaceFallback : Font.Font
    , url : String

    -- Many more things need to be added here, like size, weight, etc...
    , small : Int
    , default : Int
    , large : Int
    , jumbo : Int
    }


default : Configuration
default =
    { color =
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
        , transparent = colors.transparent
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
        , textLight = colors.white
        , textDark = colors.black
        , luminanceThreshold = 0.55
        }
    , font =
        { url = "https://fonts.googleapis.com/css?family=Noto+Sans"
        , typeface = "Noto Sans"
        , typefaceFallback = Font.sansSerif
        , small = 12
        , default = 16
        , large = 24
        , jumbo = 32
        }
    , button =
        { paddingSmall = { x = 9, y = 3 }
        , paddingDefault = { x = 12, y = 5 }
        , paddingLarge = { x = 18, y = 9 }
        , paddingJumbo = { x = 24, y = 24 }
        , defaultColorBackground = colors.white
        , defaultColorBorder = colors.greyLighter
        , hoverColorDelta = 10
        }
    }
