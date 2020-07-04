let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let types = ../types.dhall

let GitSubmoduleStrategy/toJSON
    : types.GitSubmoduleStrategy → JSON.Type
    = λ(s : types.GitSubmoduleStrategy) →
        JSON.string (merge { Normal = "normal", Recursive = "recursive" } s)

in  GitSubmoduleStrategy/toJSON
