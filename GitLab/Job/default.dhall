let Prelude = ../Prelude

let Script = ../Script/Type

let ArtifactsSpec = ../ArtifactsSpec/Type

let CacheSpec = ../CacheSpec/Type

let Rule = ../Rule/Type

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
    : ./Type
