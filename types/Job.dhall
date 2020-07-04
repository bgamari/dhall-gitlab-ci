let Prelude = ../Prelude.dhall
let Script = ./Script.dhall
let ArtifactsSpec = ./ArtifactsSpec.dhall
let CacheSpec = ./CacheSpec.dhall
let Rule = ./Rule.dhall
in

{ Type = 
    { stage : Optional Text
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
    , artifacts : Optional ArtifactsSpec.Type
    }

, default =
    { stage = None Text
    , image = None Text
    , variables = Prelude.Map.empty Text Text
    , rules = None (List Rule)
    , dependencies = [] : List Text
    , allow_failure = False
    , tags = None (List Text)
    , before_script = None Script
    , script = [] : Script
    , after_script = None Script
    , cache = None CacheSpec
    , artifacts = None ArtifactsSpec.Type
    }
}