let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let Map = Prelude.Map

let Top = ./Type.dhall

let Job = ../Job/package.dhall

let Rule = ../Rule/package.dhall

let Include = ../Include/package.dhall

let Defaults = ../Defaults/package.dhall

let GitSubmoduleStrategy/toJSON = ../GitSubmoduleStrategy/toJSON.dhall

let dropNones = ../utils/dropNones.dhall

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

let Top/toJSON
    : Top → JSON.Type
    = λ(top : Top) →
        let jobs
            : Map.Type Text JSON.Type
            = Prelude.Map.map Text Job.Type JSON.Type Job.toJSON top.jobs

        let others
            : Map.Type Text JSON.Type
            = dropNones
                Text
                JSON.Type
                ( toMap
                    { stages =
                        Prelude.Optional.map
                          (List Text)
                          JSON.Type
                          stringsArray
                          top.stages
                    , variables =
                        let submoduleMap
                            : Map.Type Text JSON.Type
                            = toMap
                                { GIT_SUBMODULE_STRATEGY =
                                    GitSubmoduleStrategy/toJSON
                                      top.gitSubmoduleStrategy
                                }

                        in  Some
                              ( JSON.object
                                  (   submoduleMap
                                    # Prelude.Map.map
                                        Text
                                        Text
                                        JSON.Type
                                        JSON.string
                                        top.variables
                                  )
                              )
                    , workflow =
                        if    Prelude.List.null Rule.Type top.workflow
                        then  None JSON.Type
                        else  Some
                                ( JSON.object
                                    ( toMap
                                        { rules =
                                            JSON.array
                                              ( Prelude.List.map
                                                  Rule.Type
                                                  JSON.Type
                                                  Rule.toJSON
                                                  top.workflow
                                              )
                                        }
                                    )
                                )
                    , default =
                        Prelude.Optional.map
                          Defaults.Type
                          JSON.Type
                          Defaults.toJSON
                          top.default
                    , include =
                        if    Prelude.List.null Include.Type top.include
                        then  None JSON.Type
                        else  Some
                                ( JSON.array
                                    ( Prelude.List.map
                                        Include.Type
                                        JSON.Type
                                        Include.toJSON
                                        top.include
                                    )
                                )
                    }
                )

        let everything
            : Map.Type Text JSON.Type
            = jobs # others

        in  JSON.object everything

in  Top/toJSON
