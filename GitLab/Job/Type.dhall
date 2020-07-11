let Prelude = ../Prelude

let Script = ../Script/Type

let ArtifactsSpec = ../ArtifactsSpec/Type

let CacheSpec = ../CacheSpec/Type

let Rule = ../Rule/Type

in  { stage : Optional Text
    , image : Optional Text
    , variables : Prelude.Map.Type Text Text
    , rules : Optional (List Rule)
    , dependencies : List Text
    , allow_failure : Bool
    , tags : Optional (List Text)
    , before_script : Optional Script
    , script : Script
    , after_script : Optional Script
    , cache : Optional CacheSpec
    , artifacts : Optional ArtifactsSpec
    }
