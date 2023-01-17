let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let When = ../When/package.dhall

let CacheSpec = ./Type.dhall

let CacheKey = ../CacheKey/package.dhall

let CachePolicy = ../CachePolicy/package.dhall

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let List/map = Prelude.List.map

in  let CacheSpec/toJSON
        : CacheSpec → JSON.Type
        = λ(cs : CacheSpec) →
            let obj
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { key =
                        Optional/map
                          CacheKey.Type
                          JSON.Type
                          CacheKey.toJSON
                          cs.key
                    , paths =
                        if    Prelude.List.null Text cs.paths
                        then  None JSON.Type
                        else  Some
                                ( JSON.array
                                    ( List/map
                                        Text
                                        JSON.Type
                                        JSON.string
                                        cs.paths
                                    )
                                )
                    , untracked =
                        Optional/map Bool JSON.Type JSON.bool cs.untracked
                    , when = 
                        Optional/map 
                            When.Type 
                            JSON.Type
                            When.toJSON
                            cs.when
                    , policy =
                        Optional/map
                            CachePolicy.Type
                            JSON.Type
                            CachePolicy.toJSON
                            cs.policy
                    }

            in  JSON.object (dropNones Text JSON.Type obj)

    in  CacheSpec/toJSON
