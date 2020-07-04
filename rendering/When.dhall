let Prelude = ../Prelude.dhall
let JSON = Prelude.JSON
let types = ../types.dhall

let When/toJSON 
        : types.When -> JSON.Type
        = \ (when : types.When) -> JSON.string (merge
        { Always = "always"
        , Manual = "manual"
        , Never = "never"
        }
        when)
in When/toJSON
