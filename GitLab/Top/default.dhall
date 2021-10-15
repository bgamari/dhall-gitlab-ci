let Prelude = ../Prelude.dhall

let Job = ../Job/Type.dhall

let Rule = ../Rule/Type.dhall

let Defaults = ../Defaults/Type.dhall

let GitSubmoduleStrategy = ../GitSubmoduleStrategy/Type.dhall

in    { jobs = Prelude.Map.empty Text Job
      , stages = None (List Text)
      , gitSubmoduleStrategy = GitSubmoduleStrategy.Normal
      , variables = Prelude.Map.empty Text Text
      , workflow = [] : List Rule
      , default = None Defaults
      }
    : ./Type.dhall
