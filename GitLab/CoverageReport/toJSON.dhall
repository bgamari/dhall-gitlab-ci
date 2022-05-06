let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let CoverageFormat = ../CoverageFormat/package.dhall

let CoverageReport = ./Type.dhall

in  let CoverageReport/toJSON
        : CoverageReport → JSON.Type
        = λ(report : CoverageReport) →
            let everything
                : Map.Type Text JSON.Type
                = toMap
                    { coverage_format =
                        CoverageFormat.toJSON report.coverage_format
                    , path = JSON.string report.path
                    }

            in  JSON.object everything

    in  CoverageReport/toJSON
