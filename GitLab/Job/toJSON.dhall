let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Job = ./Type.dhall

let Image = ../Image/package.dhall

let ArtifactsSpec = ../ArtifactsSpec/package.dhall

let CacheSpec = ../CacheSpec/package.dhall

let Rule = ../Rule/package.dhall

let Script = ../Script/package.dhall

let Service = ../Service/package.dhall

let Environment = ../Environment/package.dhall

let Trigger = ../Trigger/package.dhall

let When = ../When/package.dhall

let Parallel = ../Parallel/package.dhall

let dropNones = ../utils/dropNones.dhall

let optionalList = ../utils/optionalList.dhall

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
                        let rulesList = optionalList Rule.Type job.rules

                        in  if    Prelude.List.null Rule.Type rulesList
                            then  None JSON.Type
                            else  Some
                                    ( JSON.array
                                        ( Prelude.List.map
                                            Rule.Type
                                            JSON.Type
                                            Rule.toJSON
                                            rulesList
                                        )
                                    )
                    , dependencies =
                        if    Prelude.Optional.null (List Text) job.dependencies
                        then  None JSON.Type
                        else  let dependenciesList =
                                    optionalList Text job.dependencies

                              in  Some (stringsArrayJSON dependenciesList)
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
                          Script.Type
                          JSON.Type
                          stringsArrayJSON
                          job.before_script
                    , script =
                        if    Prelude.List.null Text job.script
                        then  None JSON.Type
                        else  Some (stringsArrayJSON job.script)
                    , services =
                        let servicesList =
                              optionalList Service.Type job.services

                        in  if    Prelude.List.null Service.Type servicesList
                            then  None JSON.Type
                            else  Some
                                    ( JSON.array
                                        ( Prelude.List.map
                                            Service.Type
                                            JSON.Type
                                            Service.toJSON
                                            servicesList
                                        )
                                    )
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
                    , timeout =
                        Optional/map Text JSON.Type JSON.string job.timeout
                    , extends =
                        if    Prelude.List.null Text job.extends
                        then  None JSON.Type
                        else  Some
                                ( JSON.array
                                    ( Prelude.List.map
                                        Text
                                        JSON.Type
                                        JSON.string
                                        job.extends
                                    )
                                )
                    , when =
                        Optional/map When.Type JSON.Type When.toJSON job.when
                    , parallel =
                        Optional/map
                          Parallel.Type
                          JSON.Type
                          Parallel.toJSON
                          job.parallel
                    }

            in  JSON.object (dropNones Text JSON.Type everything)

    in  Job/toJSON
