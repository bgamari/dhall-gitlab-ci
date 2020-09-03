let Prelude = ../Prelude.dhall

let Script = ../Script/Type.dhall

let ArtifactsSpec = ../ArtifactsSpec/Type.dhall

let CacheSpec = ../CacheSpec/Type.dhall

let Rule = ../Rule/Type.dhall

in  { stage : Optional Text
    , image : Optional Text
    , variables : Prelude.Map.Type Text Text
    , rules : Optional (List Rule)
    , dependencies : List Text
    , needs : List Text
    , allow_failure : Bool
    , tags : Optional (List Text)
    , before_script : Optional Script
    , script : Script
    , services : Optional (List Text)
    , after_script : Optional Script
    , cache : Optional CacheSpec
    , artifacts : Optional ArtifactsSpec
    }
