let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let GitSubmoduleStrategy = ./Type.dhall

let GitSubmoduleStrategy/toJSON
    : GitSubmoduleStrategy → JSON.Type
    = λ(s : GitSubmoduleStrategy) →
        JSON.string (merge { Normal = "normal", Recursive = "recursive" } s)

in  GitSubmoduleStrategy/toJSON
