{- Right biased on conflict but prefers Some to None and merges lists and maps -}
let Prelude = ../../Prelude.dhall

let Job = ./Type.dhall

let Image = ../Image/package.dhall

let Script = ../Script/package.dhall

let Service = ../Service/package.dhall

let ArtifactsSpec = ../ArtifactsSpec/package.dhall

let CacheSpec = ../CacheSpec/package.dhall

let Environment = ../Environment/package.dhall

let Rule = ../Rule/package.dhall

let Trigger = ../Trigger/package.dhall

let Inherit = ../Inherit/package.dhall

let mergeOptional = ../utils/mergeOptional.dhall

let mergeOptionalRight = ../utils/mergeOptionalRight.dhall

let mergeOptionalList = ../utils/mergeOptionalList.dhall

let append
    : Job → Job → Job
    = λ(a : Job) →
      λ(b : Job) →
        { stage = mergeOptionalRight Text a.stage b.stage
        , image = mergeOptional Image.Type Image.append a.image b.image
        , variables = a.variables # b.variables
        , rules = mergeOptionalList Rule.Type a.rules b.rules
        , dependencies = a.dependencies # b.dependencies
        , needs = a.needs # b.needs
        , allow_failure = b.allow_failure
        , tags = mergeOptionalList Text a.tags b.tags
        , before_script = mergeOptionalList Text a.before_script b.before_script
        , script = a.script # b.script
        , services = mergeOptionalList Service.Type a.services b.services
        , after_script = mergeOptionalList Text a.after_script b.after_script
        , cache = mergeOptional CacheSpec.Type CacheSpec.append a.cache b.cache
        , artifacts =
            mergeOptional
              ArtifactsSpec.Type
              ArtifactsSpec.append
              a.artifacts
              b.artifacts
        , resource_group =
            mergeOptionalRight Text a.resource_group b.resource_group
        , environment =
            mergeOptional
              Environment.Type
              Environment.append
              a.environment
              b.environment
        , trigger =
            mergeOptional Trigger.Type Trigger.append a.trigger b.trigger
        , timeout = mergeOptionalRight Text a.timeout b.timeout
        , extends = a.extends # b.extends
        , inherit = mergeOptionalRight Inherit.Type a.inherit b.inherit
        }

in  append
