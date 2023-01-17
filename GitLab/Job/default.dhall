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

in    { stage = None Text
      , image = None Image
      , variables = Prelude.Map.empty Text Text
      , rules = None (List Rule)
      , dependencies = None (List Text)
      , needs = None (List Needs)
      , allow_failure = False
      , tags = None (List Text)
      , before_script = None Script
      , script = [] : Script
      , coverage = None Text
      , services = None (List Service)
      , after_script = None Script
      , cache = None (List CacheSpec)
      , artifacts = None ArtifactsSpec
      , resource_group = None Text
      , retry = None Natural
      , environment = None Environment
      , trigger = None Trigger
      , timeout = None Text
      , extends = [] : List Text
      , when = None When
      , parallel = None Parallel
      }
    : ./Type.dhall
