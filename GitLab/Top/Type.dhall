let Prelude = ../Prelude.dhall

let Job = ../Job/Type.dhall

let GitSubmoduleStrategy = ../GitSubmoduleStrategy/Type.dhall

in  { jobs : Prelude.Map.Type Text Job
    , stages : Optional (List Text)
    , gitSubmoduleStrategy : GitSubmoduleStrategy
    }
