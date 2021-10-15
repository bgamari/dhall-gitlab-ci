let Defaults = ./Type.dhall

let Service = ../Service/Type.dhall

let CacheSpec = ../CacheSpec/Type.dhall

in    { image = None Text
      , before_script = [] : List Text
      , after_script = [] : List Text
      , services = [] : List Service
      , cache = None CacheSpec
      }
    : Defaults
