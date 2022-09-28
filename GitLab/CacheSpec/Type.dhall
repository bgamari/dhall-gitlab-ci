let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall

let CacheKey = ../CacheKey/Type.dhall

in  { key : Optional CacheKey
    , paths : List Text
    , untracked : Optional Bool
    , when : When
    , policy : Optional CachePolicy
    }
