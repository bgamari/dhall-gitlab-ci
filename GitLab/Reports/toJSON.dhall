let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let Reports = ./Type.dhall

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

in  let Reports/toJSON
        : Reports → JSON.Type
        = λ(reports : Reports) →
            let everything
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { junit =
                        Optional/map
                          (List Text)
                          JSON.Type
                          stringsArray
                          reports.junit
                    }

            in  JSON.object (dropNones Text JSON.Type everything)

    in  Reports/toJSON
