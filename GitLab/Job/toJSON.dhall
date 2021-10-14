let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Job = ./Type.dhall

let Image = ../Image/package.dhall

let ArtifactsSpec = ../ArtifactsSpec/package.dhall

let CacheSpec = ../CacheSpec/package.dhall

let Rule = ../Rule/package.dhall

let Script = ../Script/package.dhall

let Environment = ../Environment/package.dhall

let Trigger = ../Trigger/package.dhall

let dropNones = ../utils/dropNones.dhall

let stringsArrayJSON = ../utils/stringsArrayJSON.dhall

let Optional/map = Prelude.Optional.map

let Optional/toList = Prelude.Optional.toList

in  let Job/toJSON
        : Job → JSON.Type
        = λ(job : Job) →
            let everything
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { stage = Optional/map Text JSON.Type JSON.string job.stage
                    , image =
                        Optional/map Image.Type JSON.Type Image.toJSON job.image
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
                        let rulesList =
                              merge
                                { Some = λ(rules : List Rule) → rules
                                , None = [] : List Rule
                                }
                                job.rules

                        in  if    Prelude.List.null Rule rulesList
                            then  None JSON.Type
                            else  Some
                                    ( JSON.array
                                        ( Prelude.List.map
                                            Rule
                                            JSON.Type
                                            Rule/toJSON
                                            rulesList
                                        )
                                    )
                    , dependencies =
                        if    Prelude.List.null Text job.dependencies
                        then  None JSON.Type
                        else  Some (stringsArrayJSON job.dependencies)
                    , needs =
                        if    Prelude.List.null Text job.needs
                        then  None JSON.Type
                        else  Some (stringsArrayJSON job.needs)
                    , tags =
                        Optional/map
                          (List Text)
                          JSON.Type
                          stringsArrayJSON
                          job.tags
                    , allow_failure = Some (JSON.bool job.allow_failure)
                    , before_script =
                        Optional/map
                          Script
                          JSON.Type
                          stringsArrayJSON
                          job.before_script
                    , script = Some (stringsArrayJSON job.script)
                    , services =
                        Optional/map
                          (List Text)
                          JSON.Type
                          stringsArrayJSON
                          job.services
                    , after_script =
                        Optional/map
                          Script.Type
                          JSON.Type
                          stringsArrayJSON
                          job.after_script
                    , cache =
                        Optional/map
                          CacheSpec.Type
                          JSON.Type
                          CacheSpec.toJSON
                          job.cache
                    , artifacts =
                        Optional/map
                          ArtifactsSpec.Type
                          JSON.Type
                          ArtifactsSpec.toJSON
                          job.artifacts
                    , resource_group =
                        Optional/map
                          Text
                          JSON.Type
                          JSON.string
                          job.resource_group
                    , environment =
                        Optional/map
                          Environment.Type
                          JSON.Type
                          Environment.toJSON
                          job.environment
                    , trigger =
                        Optional/map
                          Trigger.Type
                          JSON.Type
                          Trigger.toJSON
                          job.trigger
                    }

            in  JSON.object (dropNones Text JSON.Type everything)

    in  Job/toJSON
