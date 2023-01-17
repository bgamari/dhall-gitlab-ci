let Prelude = ../Prelude.dhall

let Service = ../Service/Type.dhall

let CacheSpec = ../CacheSpec/Type.dhall

in  { image : Optional Text
    , before_script : List Text
    , after_script : List Text
    , services : List Service
    , cache : Optional CacheSpec
    , retry : Optional Natural
    }
