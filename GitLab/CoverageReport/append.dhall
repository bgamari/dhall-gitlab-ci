let CoverageReport = ./Type.dhall

let append
    : CoverageReport → CoverageReport → CoverageReport
    = λ(a : CoverageReport) →
      λ(b : CoverageReport) →
        { coverage_format = b.coverage_format, path = b.path }

in  append
