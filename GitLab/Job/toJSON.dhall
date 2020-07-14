let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Job = ./Type.dhall

let ArtifactsSpec = ../ArtifactsSpec/Type.dhall

let CacheSpec = ../CacheSpec/Type.dhall

let Rule = ../Rule/Type.dhall

let Script = ../Script/Type.dhall

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let CacheSpec/toJSON = ../CacheSpec/toJSON.dhall

let ArtifactsSpec/toJSON = ../ArtifactsSpec/toJSON.dhall

in  let Job/toJSON
        : Job → JSON.Type
        = λ(job : Job) →
            let stringsArray
                : List Text → JSON.Type
                = λ(xs : List Text) →
                    JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

            let everything
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { stage = Optional/map Text JSON.Type JSON.string job.stage
                    , image = Optional/map Text JSON.Type JSON.string job.image
                    , variables = Some
                        ( JSON.object
                            ( Map.map
                                Text
                                Text
                                JSON.Type
                                JSON.string
                                job.variables
                            )
                        )
                    , rules =
                        Optional/map
                          (List Rule)
                          JSON.Type
                          (λ(rules : List Rule) → JSON.null)
                          job.rules
                    , dependencies =
                        if    Prelude.List.null Text job.dependencies
                        then  None JSON.Type
                        else  Some (stringsArray job.dependencies)
                    , tags =
                        Optional/map (List Text) JSON.Type stringsArray job.tags
                    , allow_failure = Some (JSON.bool job.allow_failure)
                    , before_script =
                        Optional/map
                          Script
                          JSON.Type
                          stringsArray
                          job.before_script
                    , script = Some (stringsArray job.script)
                    , after_script =
                        Optional/map
                          Script
                          JSON.Type
                          stringsArray
                          job.after_script
                    , cache =
                        Optional/map
                          CacheSpec
                          JSON.Type
                          CacheSpec/toJSON
                          job.cache
                    , artifacts =
                        Optional/map
                          ArtifactsSpec
                          JSON.Type
                          ArtifactsSpec/toJSON
                          job.artifacts
                    }

            in  JSON.object (dropNones Text JSON.Type everything)

    in  Job/toJSON
