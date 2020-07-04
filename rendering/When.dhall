let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let types = ../types.dhall

let When/toJSON
    : types.When → JSON.Type
    = λ(when : types.When) →
        JSON.string
          ( merge
              { Always = "always"
              , OnSuccess = "on_success"
              , OnFailure = "on_failure"
              }
              when
          )

in  When/toJSON
