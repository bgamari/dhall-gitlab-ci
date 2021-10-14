let Prelude = ../../Prelude.dhall

let When = ../When/Type.dhall

let Map = Prelude.Map.Type

in  { `if` : Optional Text
    , changes : List Text
    , allow_failure : Optional Bool
    , when : Optional When
    , exists : List Text
    , variables : Map Text Text
    }
