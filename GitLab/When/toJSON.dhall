let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let When = ./Type.dhall

let When/toJSON
    : When → JSON.Type
    = λ(when : When) →
        JSON.string
          ( merge
              { Always = "always"
              , OnSuccess = "on_success"
              , OnFailure = "on_failure"
              , Manual = "manual"
              , Delayed = "delayed"
              , Never = "never"
              }
              when
          )

in  When/toJSON
