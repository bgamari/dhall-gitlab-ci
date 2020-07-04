let Prelude = ../Prelude.dhall
let Script = ./Script.dhall
let ArtifactsSpec = ./ArtifactsSpec.dhall
let CacheSpec = ./CacheSpec.dhall
let Rule = ./Rule.dhall
in
{ stage : Text
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