let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let stringsArrayJSON
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

in  stringsArrayJSON
