module StyleGuide exposing (Flags, Model, WindowSize, init, main)

import Browser
import Browser.Navigation
import Element exposing (..)
import Element.Background as Background
import Element.Events
import Element.Font as Font
import Element.Input exposing (button)
import Framework.ColorNew
import Framework.ConfigurationNew as Configuration
import Framework.Logo as Logo
import Framework.ModifierNew exposing (Modifier(..), toButtonAttr)
import Html
import Html.Attributes
import Url


{-| -}



-- MODEL


type alias Model =
    { key : Browser.Navigation.Key
    , url : Url.Url
    , windowSize : WindowSize
    , sidebarSections : List SidebarSection
    }



-- MSG


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | ToggleSection String (Maybe Bool)
    | ToggleAllSections Bool


{-| -}



-- INIT


init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    ( { key = key
      , url = url
      , windowSize =
            { width = flags.width
            , height = flags.height
            }
      , sidebarSections = sidebarSections
      }
    , Cmd.none
    )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Browser.Navigation.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Browser.Navigation.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )

        ToggleSection sectionName forceState ->
            let
                sidebarSectionsNew =
                    List.map
                        (\section ->
                            if section.name == sectionName then
                                case forceState of
                                    Just state ->
                                        { section | open = state }

                                    Nothing ->
                                        { section | open = not section.open }

                            else
                                section
                        )
                        model.sidebarSections
            in
            ( { model | sidebarSections = sidebarSectionsNew }, Cmd.none )

        ToggleAllSections state ->
            let
                sidebarSectionsNew =
                    List.map (\section -> { section | open = state }) model.sidebarSections
            in
            ( { model | sidebarSections = sidebarSectionsNew }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Living Style Guide - Elm Style Framework"
    , body =
        [ layoutWith
            { options =
                [ focusStyle
                    { borderColor = Just Configuration.default.color.primary
                    , backgroundColor = Nothing
                    , shadow = Nothing
                    }
                ]
            }
            [ Font.family
                [ Font.external
                    { name = "Noto Sans"
                    , url = "https://fonts.googleapis.com/css?family=Noto+Sans"
                    }
                , Font.typeface "NotoSans"
                , Font.sansSerif
                ]
            , Font.size 16
            , Font.color Configuration.default.color.grey
            , Background.color Configuration.default.color.white
            , forkMe
            ]
          <|
            row [ height fill, width fill ]
                [ el [ height fill, width <| px 310, scrollbarY, clipX ] <|
                    viewSidebar model
                , el
                    [ height fill
                    , width fill
                    , scrollbarY
                    , Font.color Configuration.default.color.black
                    , Background.color Configuration.default.color.white
                    ]
                  <|
                    viewContent model
                ]
        ]
    }


viewContent : Model -> Element Msg
viewContent model =
    column
        [ paddingXY (mainPadding + 100) mainPadding
        , spacing (mainPadding - 10)
        ]
        [ el [] <| viewLogo title subTitle version
        , el [ Font.size 24 ]
            none

        -- , el [ centerX, alpha 0.2 ] <| Icon.chevronDown Framework.Color.grey 32
        -- , column
        --             []
        --           <|
        --             List.map (\( introspection, _ ) -> viewIntrospection model introspection) model.introspections
        , column
            [ spacing 10, width fill ]
            [ el [ Font.size 32, Font.bold ] (text <| "Modifiers")
            , paragraph [ Font.size 24, Font.extraLight ] [ text "A readable, easy-to-use styling system." ]
            ]
        , column
            [ spacing 10, width fill ]
            [ el [ Font.size 32, Font.bold ] (text <| "Configuration")
            , paragraph [ Font.size 24, Font.extraLight ] [ text "Description" ]
            ]

        --
        , el [ Font.size 32, Font.bold, width fill ] (text <| "Showcase")
        , column
            [ spacing 10, width fill ]
            [ el [ Font.size 32, Font.bold ] (text <| "Buttons")
            , paragraph [ Font.size 24, Font.extraLight ] [ text "Description" ]
            , column [ centerX, centerY, spacing 15 ]
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
            ]
        ]


viewSidebar : Model -> Element Msg
viewSidebar model =
    column
        [ Background.color Configuration.default.color.greyDarker
        , Font.color Configuration.default.color.greyLight
        , width fill
        , height fill
        , spacing 20
        , paddingXY mainPadding mainPadding
        ]
        [ column [ height shrink ]
            [ viewLogo titleLeftSide subTitle version ]
        , column [ moveLeft 5, height shrink, width fill ] <|
            row
                [ spacing 20
                , width fill
                , Font.color Configuration.default.color.grey
                , paddingEach { edges | bottom = 10 }
                ]
                [ el [ pointer, centerX, Element.Events.onClick (ToggleAllSections True) ] <| text "Expand All"
                , el [ pointer, centerX, Element.Events.onClick (ToggleAllSections False) ] <| text "Close All"
                ]
                :: List.map viewSidebarSections model.sidebarSections
        ]


viewLogo : Element Msg -> String -> String -> Element Msg
viewLogo title_ subTitle_ version_ =
    link []
        { label =
            column [ height shrink, spacing 10 ]
                [ el [ Font.size 60, Font.bold ] title_
                , el [ Font.size 16, Font.bold ] <| text subTitle_
                , el [ Font.size 14, Font.bold ] <| text <| "Version " ++ version_
                ]
        , url = "#"
        }



-- CONSTANTS


viewSidebarSections section =
    column
        [ Font.color Configuration.default.color.grey ]
    <|
        [ row [ Font.bold ]
            [ el
                [ paddingXY 10 5
                , pointer
                , Element.Events.onClick <| ToggleSection section.name Nothing
                , rotate
                    (if section.open then
                        pi / 2

                     else
                        0
                    )
                ]
                (text "⟩ ")
            , link [ Element.Events.onClick <| ToggleSection section.name (Just True) ]
                { label = text section.name, url = "#" ++ toId section.name }
            ]
        ]
            ++ (if section.open then
                    [ column
                        ([ height shrink
                         , Font.size 16
                         , Font.color Configuration.default.color.greyLighter
                         , spacing 8
                         , paddingEach { bottom = 15, left = 35, right = 0, top = 10 }
                         , clip
                         ]
                            ++ (if section.open then
                                    [ htmlAttribute <| Html.Attributes.class "elmStyleguideGenerator-open" ]

                                else
                                    [ htmlAttribute <| Html.Attributes.class "elmStyleguideGenerator-close" ]
                               )
                        )
                      <|
                        List.map
                            (\subSection ->
                                link []
                                    { label = text subSection
                                    , url = "#" ++ toId subSection
                                    }
                            )
                            section.subSections
                    ]

                else
                    [ none ]
                -- (viewListVariationForMenu introspection introspection.variations)
               )


sidebarSections : List SidebarSection
sidebarSections =
    [ { name = "Modifiers"
      , open = False
      , subSections =
            [ "Section 1"
            , "Section 2"
            ]
      }
    , { name = "Buttons"
      , open = False
      , subSections =
            [ "Section 1"
            , "Section 2"
            ]
      }
    , { name = "Colors"
      , open = False
      , subSections =
            [ "Section 1"
            , "Section 2"
            ]
      }
    , { name = "Customization"
      , open = False
      , subSections =
            [ "Section 1"
            , "Section 2"
            ]
      }
    ]


toId =
    String.replace " " "-" << String.toLower


mainPadding =
    41


title =
    column []
        [ link []
            { label =
                el
                    [ alpha 0.8
                    , paddingEach
                        { top = 0
                        , right = 0
                        , bottom = 20
                        , left = 0
                        }
                    ]
                <|
                    Logo.logo (Logo.LogoElm <| Logo.ElmColor Logo.Orange) 60
            , url = ".."
            }
        , paragraph
            [ Font.size 55
            , Font.bold
            , moveLeft 3
            ]
            [ el [ alpha 0.5 ] <| text "elm"
            , text "Style"
            ]
        ]


subTitle =
    "FRAMEWORK"


version =
    "2.0.0"


titleLeftSide =
    column []
        [ link []
            { label =
                el
                    [ alpha 0.3
                    , paddingEach
                        { top = 0
                        , right = 0
                        , bottom = 20
                        , left = 0
                        }
                    ]
                <|
                    Logo.logo (Logo.LogoElm <| Logo.ElmColor Logo.White) 60
            , url = ".."
            }
        , paragraph
            [ Font.size 55
            , Font.bold
            , moveLeft 3
            ]
            [ el [ alpha 0.5 ] <| text "elm"
            , text "Style"
            ]
        ]


edges =
    { left = 0, right = 0, top = 0, bottom = 0 }



-- TYPES


type alias Flags =
    { width : Int
    , height : Int
    }


type alias WindowSize =
    { width : Int, height : Int }


type alias SidebarSection =
    { name : String
    , open : Bool
    , subSections : List String
    }



-- HELPERS


forkMe : Attribute msg
forkMe =
    inFront <|
        link
            [ alignRight
            , Font.color Configuration.default.color.black
            ]
            { label = image [ width <| px 60, alpha 0.5 ] { src = "images/github.png", description = "Fork me on Github" }
            , url = "https://github.com/lucamug/style-framework"
            }


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
