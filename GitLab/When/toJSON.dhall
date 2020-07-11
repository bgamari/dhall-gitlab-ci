let Prelude = ../Prelude

let JSON = Prelude.JSON

let When = ./Type

let When/toJSON
    : When → JSON.Type
    = λ(when : When) →
        JSON.string
          ( merge
              { Always = "always"
              , OnSuccess = "on_success"
              , OnFailure = "on_failure"
              }
              when
          )

in  When/toJSON
