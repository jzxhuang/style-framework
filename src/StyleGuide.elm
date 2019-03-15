module StyleGuide exposing (Flags, Model, WindowSize, init, main)

import Browser
import Browser.Navigation
import Element exposing (..)
import Element.Background as Background
import Element.Events
import Element.Font as Font
import Framework.ColorNew
import Framework.ConfigurationNew as Configuration
import Framework.Logo as Logo
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
                    , Background.color Configuration.default.color.greyLighter
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
        , spacing mainPadding
        ]
        [ el [] <| viewLogo title subTitle version
        , el [ Font.size 24 ] none

        -- , el [ centerX, alpha 0.2 ] <| Icon.chevronDown Framework.Color.grey 32
        -- , column
        --             []
        --           <|
        --             List.map (\( introspection, _ ) -> viewIntrospection model introspection) model.introspections
        , column [] [ text "AAA" ]
        , column [] [ text "BBB" ]
        ]


viewSidebar : Model -> Element Msg
viewSidebar model =
    column
        [ Background.color Configuration.default.color.greyDarker
        , Font.color Configuration.default.color.greyLight
        , width fill
        , height fill
        , spacing 30
        , paddingXY mainPadding mainPadding
        ]
        [ column [ height shrink ]
            [ viewLogo titleLeftSide subTitle version

            {- , row
               [ spacing 10
               , Font.size 14
               , Font.color <| Color.toElementColor model.conf.grey9
               , paddingXY 0 20
               ]
               [ el [ pointer, Events.onClick MsgOpenAllSections ] <| text "Expand All"
               , el [ pointer, Events.onClick MsgCloseAllSections ] <| text "Close All"
               ]
            -}
            ]
        , column [ moveLeft 5, spacing 30, height shrink, alignTop ] <|
            List.map viewSidebarSections model.sidebarSections
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
        [ row [ Font.bold ]
            [ el
                [ padding 10
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
        , column
            ([ height shrink
             , Font.size 16
             , Font.color Configuration.default.color.greyLighter
             , spacing 8
             , paddingEach { bottom = 1, left = 35, right = 0, top = 12 }
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

        -- (viewListVariationForMenu introspection introspection.variations)
        ]


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
    "1.0.0"


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
