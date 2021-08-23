module ReverseString exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing(..)
import Html.Events exposing (onInput)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }


-- Might be always a good to start with our models (defining our data structure at first and what we want to present
-- to our users).
-- MODEL

type alias Model = 
  { content: String 
  }


-- This is a record - AKA Hash in ruby, Object in JavaScript... WDW call it the same?
-- Not the difference that we use "=" instead of ":". We apparently use ":" to define type.
init : Model
init = {
  content = ""
  }

-- UPDATE


-- "Change String" means that "Change" is our custom type and "String" is what is associated to that type.
-- For example, Change "Some String Text" (String associated to the type Change)
type Msg = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }


-- VIEW

view : Model -> Html Msg
view model = 
  div []
    [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    , div [] [ text (String.fromInt(String.length model.content)) ]
    ]