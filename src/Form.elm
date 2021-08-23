module Form exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

{-|
  We're currently calling it 'Model' but it can me any other suitable name. Just following the guide here.
  When building models, start with one field/data at a time. Work all the way through the view and then
  continue adding new fields/data. 
|-}
type alias Model =
  { name : String
  , password : String
  , confirmPassword : String
  }

init : Model
init = 
  Model "" "" "" -- new notation to pass values to our record without writing all over again.

  -- { name = "", password = "", confirmPassword = "" }

-- UPDATE

type Msg =
  Name String
  | Password String
  | ConfirmPassword String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    ConfirmPassword confirmPassword ->
      { model | confirmPassword = confirmPassword }

-- VIEW

view : Model -> Html Msg
view model =
  div [] -- you can set styles inside this []. Probably we can pass class names here in order to get styles from a .css, .scss files.
    [ viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Confirm Password" model.confirmPassword ConfirmPassword
    , viewValidation model
    ]


-- Helper functions.
viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] [] -- what is this second element? What can I put inside it?*

{-| *
  The second element of "input" and "div", so far, is the list of direct child nodes.
  So, the first brackets is related to the attributes from our field (we can set styles, placeholder, values, type, and so on here).
  The second brackets is actually the direct child nodes.
|-}

viewValidation : Model -> Html msg
viewValidation model =
  if model.password == model.confirmPassword then
    div [ style "color" "green" ] [ text "OK" ]
  else
    div [style "color" "red" ] [ text "Passwords do not match!"]


-- If you are looking at that repository and see a couple of questions and right after you got the answer to it
-- it means that I didn't know what was that and later on I just figure it out and decided to leave the answer there.
