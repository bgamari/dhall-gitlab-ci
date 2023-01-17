let Prelude = ../Prelude.dhall

let Image = ../Image/Type.dhall

let Script = ../Script/Type.dhall

let Service = ../Service/Type.dhall

let ArtifactsSpec = ../ArtifactsSpec/Type.dhall

let CacheSpec = ../CacheSpec/Type.dhall

let Environment = ../Environment/Type.dhall

let Rule = ../Rule/Type.dhall

let Trigger = ../Trigger/Type.dhall

let When = ../When/Type.dhall

let Parallel = ../Parallel/Type.dhall

let Needs = ../Needs/Type.dhall

in  { stage : Optional Text
    , image : Optional Image
    , variables : Prelude.Map.Type Text Text
    , rules : Optional (List Rule)
    , dependencies : Optional (List Text)
    , needs : Optional (List Needs)
    , allow_failure : Bool
    , tags : Optional (List Text)
    , before_script : Optional Script
    , script : Script
    , coverage : Optional Text
    , services : Optional (List Service)
    , after_script : Optional Script
    , cache : Optional (List CacheSpec)
    , artifacts : Optional ArtifactsSpec
    , resource_group : Optional Text
    , retry : Optional Natural
    , environment : Optional Environment
    , trigger : Optional Trigger
    , timeout : Optional Text
    , extends : List Text
    , when : Optional When
    , parallel : Optional Parallel
    }
