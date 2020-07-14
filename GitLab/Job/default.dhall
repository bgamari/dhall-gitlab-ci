let Prelude = ../Prelude.dhall

let Script = ../Script/Type.dhall

let ArtifactsSpec = ../ArtifactsSpec/Type.dhall

let CacheSpec = ../CacheSpec/Type.dhall

let Rule = ../Rule/Type.dhall

in    { stage = None Text
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
      , artifacts = None ArtifactsSpec
      }
    : ./Type.dhall
