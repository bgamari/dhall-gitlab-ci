let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall

let CacheKey = ../CacheKey/Type.dhall

in    { key = None CacheKey
      , when = When.OnSuccess
      , paths = [] : List Text
      , untracked = None Bool
      , policy = None CachePolicy
      }
    : ./Type.dhall
