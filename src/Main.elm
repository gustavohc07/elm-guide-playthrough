-- We are probably exposing everything we got in here. That is why the (..) notation
module Main exposing (..)

-- Wth is this doing? Why do we need it?
import Browser
-- Html elements
import Html exposing (Html, button, div, text)

-- Html events. 
import Html.Events exposing (onClick)

-- What is this doing? Is {} a way of declaring arguments of a function?
-- High level description of our program. What will be rendered on screen.
main = 
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL
-- Models are our application data? How are we passing it throught the other functions?
-- Models "are the state of your application". So probably the initial state of our data.
-- In this case init = 0 is the initial state. So our Model is an integer 0.
type alias Model = Int

init : Model
init = 
  0

-- UPDATE
type Msg = Increment | Decrement | Reset | IncrementBy10 | DecrementBy10

-- update: name of the function and I think this one is reserved by the language; msg: one of its variables; model: another variable
-- Update describes how our Model will change over time. It receives the msg from the user and behaves accordingly.

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

    Reset ->
      model - model
      
    IncrementBy10 ->
      model + 10

    DecrementBy10 ->
      model - 10


-- I think this one is reserved by the language.
view : Model -> Html Msg
view model = 
  div []
    [ button [ onClick DecrementBy10] [ text "-10" ]
    , button [ onClick Decrement] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [text "+"]
    , button [ onClick IncrementBy10 ] [text "+10"]
    , div [] [ text "" ]
    , button [ onClick Reset ] [text "RESET!"]
    ]



-- Flow
-- user interact and send a msg -> update receive the msg -> produce a new model -> call view with the new model -> render html -> repeat