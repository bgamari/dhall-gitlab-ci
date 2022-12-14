let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall

let CacheKey = ../CacheKey/Type.dhall

in  { key : Optional CacheKey
    , paths : List Text
    , untracked : Optional Bool
    , when : Optional When
    , policy : Optional CachePolicy
    }
