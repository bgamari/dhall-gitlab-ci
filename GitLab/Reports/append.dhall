let Reports = ./Type.dhall

let CoverageReport = ../CoverageReport/package.dhall

let mergeOptional = ../utils/mergeOptional.dhall

let mergeOptionalList = ../utils/mergeOptionalList.dhall

let append
    : Reports → Reports → Reports
    = λ(a : Reports) →
      λ(b : Reports) →
        { junit = mergeOptionalList Text a.junit b.junit
        , coverage_report =
            mergeOptional
              CoverageReport.Type
              CoverageReport.append
              a.coverage_report
              b.coverage_report
        }

in  append
