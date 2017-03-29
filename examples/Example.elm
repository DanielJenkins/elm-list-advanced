module Example exposing (..)

import Html exposing (Html, div, h4, span, text)
import Html.Attributes exposing (style)
import ListAdv exposing (splice)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = init, update = update, view = view }



-- MODEL


type alias Model =
    List String


init : Model
init =
    [ "A", "B", "C", "D", "E" ]



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        _ ->
            model



-- VIEW


view : Model -> Html Msg
view sampleList =
    div []
        [ div []
            [ h4 [] [ span [ style [ ( "color", "#1184CE" ) ] ] [ text "splice" ], span [] [ text " : Int -> Int -> List a -> List a" ] ]
            , div [] [ text "Starting at the index of the first parameter, splice removes the number of items from the list equal to the value of the second parameter" ]
            , div [ style [ ( "margin-left", "20px" ) ] ] [ text "let" ]
            , div [ style [ ( "margin-left", "60px" ) ] ] [ text ("sampleList = " ++ (toString sampleList)) ]
            , div [ style [ ( "margin-left", "20px" ) ] ] [ text "in" ]
            , div [ style [ ( "margin-left", "60px" ) ] ] [ text "ListAdv.splice 1 2 sampleList" ]
            , div [ style [ ( "margin-left", "60px" ) ] ] [ text ("-- Returns " ++ (toString (ListAdv.splice 1 2 sampleList))) ]
            ]
        , div []
            [ h4 [] [ span [ style [ ( "color", "#1184CE" ) ] ] [ text "indexedFilter" ], span [] [ text " : (Int -> a -> Bool) -> List a -> List a" ] ]
            , div [] [ text "Keep only the items that satisfy the predicate, which takes an index" ]
            , div [ style [ ( "margin-left", "20px" ) ] ] [ text "let" ]
            , div [ style [ ( "margin-left", "60px" ) ] ] [ text ("sampleList = " ++ (toString sampleList)) ]
            , div [ style [ ( "margin-left", "20px" ) ] ] [ text "in" ]
            , div [ style [ ( "margin-left", "60px" ) ] ] [ text "ListAdv.indexedFilter (\\index value -> index == 2 || value == \"D\") sampleList" ]
            , div [ style [ ( "margin-left", "60px" ) ] ] [ text ("-- Returns " ++ (toString (ListAdv.indexedFilter (\index value -> index == 2 || value == "D") sampleList))) ]
            ]
        ]
