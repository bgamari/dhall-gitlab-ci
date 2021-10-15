let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall

in  { key : Text
    , paths : List Text
    , untracked : Optional Bool
    , when : When
    , policy : Optional CachePolicy
    }
