import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
-- https://guide.elm-lang.org/architecture/forms.html

-- Main

main = 
  Browser.sandbox {init = init, update = update, view = view}

-- Model

type alias Model = 
  { text : String
  }

init: Model
init =
  {text = "Text to Transliterate"}

-- Update

type Msg = 
  Change String

update: Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | text = newContent}

-- View

view: Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Place your text here." model.text Change

    ]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [type_ t, placeholder p, value v, onInput toMsg] []