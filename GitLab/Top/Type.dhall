let Prelude = ../Prelude.dhall

let Job = ../Job/Type.dhall

let Rule = ../Rule/Type.dhall

let Include = ../Include/Type.dhall

let Defaults = ../Defaults/Type.dhall

let GitSubmoduleStrategy = ../GitSubmoduleStrategy/Type.dhall

in  { jobs : Prelude.Map.Type Text Job
    , stages : Optional (List Text)
    , gitSubmoduleStrategy : GitSubmoduleStrategy
    , variables : Prelude.Map.Type Text Text
    , workflow : List Rule
    , default : Optional Defaults
    , include : List Include
    }
