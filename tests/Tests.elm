module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import ProductLibrary exposing (..)
import Utils


all : Test
all =
    describe "all"
        [ describe "update" updateTests
        , describe "id" idTests
        ]


updateTests : List Test
updateTests =
    [ test "NoOp" <|
        \() ->
            update NoOp testModel
                |> Expect.equal testModel
    , test "NewProductText" <|
        \() ->
            update (NewProductText "foo") testModel
                |> .newProductText
                |> Expect.equal "foo"
    , describe "Create"
        [ test "Uses the correct string" <|
            \() ->
                Model [] "foo"
                    |> update Create
                    |> .products
                    |> List.head
                    |> maybeExpect (\{ name } -> Expect.equal name "foo")
        , test "Clears newProductName field" <|
            \() ->
                Model [] "foo"
                    |> update Create
                    |> .newProductText
                    |> Expect.equal ""
        ]
    ]


idTests : List Test
idTests =
    [ test "creates unique id" <|
        \() ->
            Utils.id [ 1, 2 ]
                |> Expect.equal 3
    ]



-- HELPERS


maybeExpect : (val -> Expect.Expectation) -> Maybe val -> Expect.Expectation
maybeExpect f maybeVal =
    case maybeVal of
        Nothing ->
            Expect.fail "Got Nothing!"

        Just val ->
            f val


testModel : Model
testModel =
    { products =
        [ Product "1" "Bagel"
        , Product "2" "Toast"
        ]
    , newProductText = ""
    }


testProduct : Product
testProduct =
    Product "3" "Juice"
