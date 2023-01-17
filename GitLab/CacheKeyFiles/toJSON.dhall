let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let CacheKeyFiles = ./Type.dhall

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let List/map = Prelude.List.map

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

in  let CacheKeyFiles/toJSON
        : CacheKeyFiles → JSON.Type
        = λ(ck : CacheKeyFiles) →
            let obj
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { files =
                        if    Prelude.List.null Text ck.files
                        then  None JSON.Type
                        else  Some
                                ( JSON.array
                                    ( Prelude.List.map
                                        Text
                                        JSON.Type
                                        JSON.string
                                        ck.files
                                    )
                                )
                    , prefix = Optional/map Text JSON.Type JSON.string ck.prefix
                    }

            in  JSON.object (dropNones Text JSON.Type obj)

    in  CacheKeyFiles/toJSON
