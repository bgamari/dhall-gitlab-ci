let When = ../When/Type

let Duration = ../Duration/Type

in  { when : When
    , expire_in : Duration
    , reports : { junit : Optional Text }
    , paths : List Text
    }
