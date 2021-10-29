let CacheSpec = ./Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall

let mergeOptionalRight = ../utils/mergeOptionalRight.dhall

let append
    : CacheSpec → CacheSpec → CacheSpec
    = λ(a : CacheSpec) →
      λ(b : CacheSpec) →
        { key = b.key
        , paths = a.paths # b.paths
        , untracked = mergeOptionalRight Bool a.untracked b.untracked
        , when = b.when
        , policy = mergeOptionalRight CachePolicy a.policy b.policy
        }

in  append
