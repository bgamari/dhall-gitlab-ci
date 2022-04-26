let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let Map = Prelude.Map

let Matrix = ./Type.dhall

let stringsArrayJSON = ../utils/stringsArrayJSON.dhall

let List/map = Prelude.List.map

let Map/map = Prelude.Map.map

let textListTextMapJSON
    : ∀(hash : Map.Type Text (List Text)) → JSON.Type
    = λ(hash : Map.Type Text (List Text)) →
        JSON.object (Map/map Text (List Text) JSON.Type stringsArrayJSON hash)

let Matrix/toJSON
    : Matrix → JSON.Type
    = λ(matrix : Matrix) →
        JSON.array
          ( List/map
              (Map.Type Text (List Text))
              JSON.Type
              textListTextMapJSON
              matrix
          )

in  Matrix/toJSON
