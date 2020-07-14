let When = ../When/Type.dhall

let Duration = ../Duration/Type.dhall

in  { when : When
    , expire_in : Duration
    , reports : { junit : Optional Text }
    , paths : List Text
    }
