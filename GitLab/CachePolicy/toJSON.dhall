let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let CachePolicy = ./Type.dhall

let CachePolicy/toJSON
    : CachePolicy → JSON.Type
    = λ(policy : CachePolicy) →
        JSON.string
          ( merge
              { Pull = "pull", Push = "push", PullPush = "pull-push" }
              policy
          )

in  CachePolicy/toJSON
