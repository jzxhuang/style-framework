module Framework.ModifierNew exposing
    ( Modifier(..)
    , toButtonAttr
    )

{-| [Demo](https://lucamug.github.io/style-framework/generated-framework.html#/framework/Buttons/States)


# Modifiers

@docs Modifier


# Conver to elm-ui attributes

@docs toButtonAttr

-}

import Element
import Framework.ButtonNew
import Framework.ConfigurationNew as Configuration


{-| This is the main list of modifier that can be used with all elements
-}
type
    Modifier
    -- Colors:  ALL
    = Primary
    | Success
    | Info
    | Warning
    | Danger
      -- Sizes:   applicable to Button, Inputs, ...
    | Small
    | Large
    | Jumbo
      -- Outline: Button, ...
    | Outlined
      -- States:  Button, Inputs, ...
      -- Are Loading/Waiting not the same? We can consider | Loading Spinner if we want,
      -- or let them put spinner themselves and preselect a spinner (standard practice)
    | Loading
    | Disabled



-- Button


{-| From a list of Modifiers, generate a list of attributes that can be attached to any element

    row (toButtonAttr [ Info ] ++ [ spacing 10 ]) [ text "Col 1", text "Col 2" ]

-}
toButtonAttr : Maybe Configuration.Configuration -> List Modifier -> List (Element.Attribute msg)
toButtonAttr maybeConfiguration modifiers =
    Maybe.withDefault Configuration.default maybeConfiguration
        |> (\configuration ->
                Framework.ButtonNew.toButtonAttr
                    configuration
                    (List.foldl (toButtonConfig configuration) Framework.ButtonNew.defaultConfig modifiers)
           )


toButtonConfig : Configuration.Configuration -> Modifier -> Framework.ButtonNew.Config -> Framework.ButtonNew.Config
toButtonConfig configuration modifier buttonConfig =
    case modifier of
        -- Colors
        Primary ->
            { buttonConfig | color = Just configuration.color.primary }

        Success ->
            { buttonConfig | color = Just configuration.color.success }

        Info ->
            { buttonConfig | color = Just configuration.color.info }

        Warning ->
            { buttonConfig | color = Just configuration.color.warning }

        Danger ->
            { buttonConfig | color = Just configuration.color.danger }

        -- SIZES
        Small ->
            { buttonConfig | size = Just Framework.ButtonNew.Small }

        Large ->
            { buttonConfig | size = Just Framework.ButtonNew.Large }

        Jumbo ->
            { buttonConfig | size = Just Framework.ButtonNew.Jumbo }

        -- SHAPE
        Outlined ->
            { buttonConfig | outlined = True }

        -- STATES
        Loading ->
            { buttonConfig | state = Framework.ButtonNew.Loading }

        Disabled ->
            { buttonConfig | state = Framework.ButtonNew.Disabled }
