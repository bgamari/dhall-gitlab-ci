let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let CoverageReport = ../CoverageReport/package.dhall

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
                    , coverage_report =
                        Optional/map
                          CoverageReport.Type
                          JSON.Type
                          CoverageReport.toJSON
                          reports.coverage_report
                    }

            in  JSON.object (dropNones Text JSON.Type everything)

    in  Reports/toJSON
