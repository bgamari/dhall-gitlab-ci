let Prelude = ../Prelude

let Job = ../Job/Type

let GitSubmoduleStrategy = ../GitSubmoduleStrategy/Type

in  { jobs : Prelude.Map.Type Text Job
    , stages : Optional (List Text)
    , gitSubmoduleStrategy : GitSubmoduleStrategy
    }
