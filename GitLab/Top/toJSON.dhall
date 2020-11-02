let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let Map = Prelude.Map

let Top = ./Type.dhall

let Job = ../Job/Type.dhall

let Job/toJSON = ../Job/toJSON.dhall

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
            = Prelude.Map.map Text Job JSON.Type Job/toJSON top.jobs

        let others
            : Map.Type Text JSON.Type
            = dropNones
                Text
                JSON.Type
                ( toMap
                    {
                        image = Prelude.Optional.map (Text) JSON.Type JSON.string top.image
                    ,   stages =
                        Prelude.Optional.map
                          (List Text)
                          JSON.Type
                          stringsArray
                          top.stages
                    , variables =
                        Some (
                            JSON.object (
                                Prelude.List.concat ({ mapKey: Text , mapValue: JSON.Type}) [
                                    toMap {
                                        GIT_SUBMODULE_STRATEGY = GitSubmoduleStrategy/toJSON top.gitSubmoduleStrategy
                                    }
                                ,   Prelude.Map.map Text Text JSON.Type JSON.string top.variables
                                ]
                            )
                        )
                    }
                )

        let everything
            : Map.Type Text JSON.Type
            = jobs # others

        in  JSON.object everything

in  Top/toJSON
