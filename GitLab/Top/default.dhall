let Prelude = ../Prelude.dhall

let Job = ../Job/Type.dhall

let GitSubmoduleStrategy = ../GitSubmoduleStrategy/Type.dhall

in    { jobs = Prelude.Map.empty Text Job
      , stages = None (List Text)
      , gitSubmoduleStrategy = GitSubmoduleStrategy.Normal
      , image = None (Text)
      , variables = Prelude.Map.empty Text Text
      }
    : ./Type.dhall
