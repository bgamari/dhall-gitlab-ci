let Trigger = ./Type.dhall

let mergeOptionalRight = ../utils/mergeOptionalRight.dhall

let append
    : Trigger → Trigger → Trigger
    = λ(a : Trigger) →
      λ(b : Trigger) →
        { project = mergeOptionalRight Text a.project b.project
        , branch = mergeOptionalRight Text a.branch b.branch
        , include = a.include # b.include
        , strategy = b.strategy
        }

in  append
