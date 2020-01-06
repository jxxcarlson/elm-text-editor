# Editor Installation

To install the Editor in app, use the outline below, 
consulting the code in `./demo` 

## Installation

```bash
elm install lukewestby/elm-string-interpolate
elm install bemyak/elm-slider
elm install lovasoa/elm-rolling-list
elm install elm-community/string-extra
elm install elm-community/maybe-extra
elm install elm-community/list-extra
elm install folkertdev/elm-paragraph
```

## Imports

```
import Editor exposing (EditorConfig, Editor, EditorMsg)
import Editor.Config exposing (WrapOption(..))   
import SingleSlider as Slider
```

## Msg

```elm
type Msg
    = EditorMsg EditorMsg
    | SliderMsg Slider.Msg
    | ...
```

## Model

```elm
type alias Model =
    { editor : Editor
    , clipboard : String
    , ...
    }
```

## Init

```elm
init : () -> ( Model, Cmd Msg )
init () =
    ( { editor = Editor.init config "Some text ..."
      , clipboard = ""
      }
    , Cmd.none
    )
```


where (for example):

```elm
config : EditorConfig Msg
config =
    { editorMsg = EditorMsg
    , sliderMsg = SliderMsg
    , editorStyle = editorStyle
    , width = 500
    , lines = 30
    , lineHeight = 16.0
    , showInfoPanel = True
    , wrapParams = { maximumWidth = 55, optimalWidth = 50, stringWidth = String.length }
    , wrapOption = DontWrap
    }
```

```
editorStyle : List (Html.Attribute msg)
editorStyle =
    [ HA.style "background-color" "#dddddd"
    , HA.style "border" "solid 0.5px"
    ]
```


## Update

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
      case msg of
        EditorMsg msg_ ->
            let
               (editor, cmd) = Editor.update msg_ model.editor
            in
              ({ model | editor = editor }, Cmd.map EditorMsg cmd)


        SliderMsg sliderMsg ->
            let
                ( newEditor, cmd ) =
                    Editor.sliderUpdate sliderMsg model.editor
            in
            ( { model | editor = newEditor }, cmd |> Cmd.map SliderMsg )

        -- The below are optional, and used for external copy/pastes
        -- See module `Outside` and also `index.html` for additional
        -- information
        
        Outside infoForElm ->
            case infoForElm of

                Outside.GotClipboard clipboard ->
                    ({model | clipboard = clipboard}, Cmd.none)

        AskForClipBoard ->
            (model, Outside.sendInfo (Outside.AskForClipBoard E.null))

        PasteClipboard ->
                    pasteToClipboard model
 
        Other cases ...
```

## Subscriptions

```elm
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map SliderMsg <|
            Slider.subscriptions (Editor.slider model.editor)
        ]
```

## View

```elm
view : Model -> Html Msg
view model =
    div [ HA.style "margin" "60px" ]
        [ title -- for example
        , Editor.embedded config model.editor
        , footer model -- for example
        ]
```
