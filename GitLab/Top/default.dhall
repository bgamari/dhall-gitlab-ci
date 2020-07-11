let Prelude = ../Prelude

let Job = ../Job/Type

let GitSubmoduleStrategy = ../GitSubmoduleStrategy/Type

in    { jobs = Prelude.Map.empty Text Job
      , stages = None (List Text)
      , gitSubmoduleStrategy = GitSubmoduleStrategy.Normal
      }
    : ./Type
