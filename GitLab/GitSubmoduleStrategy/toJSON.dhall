let Prelude = ../Prelude

let JSON = Prelude.JSON

let GitSubmoduleStrategy = ./Type

let GitSubmoduleStrategy/toJSON
    : GitSubmoduleStrategy → JSON.Type
    = λ(s : GitSubmoduleStrategy) →
        JSON.string (merge { Normal = "normal", Recursive = "recursive" } s)

in  GitSubmoduleStrategy/toJSON
