let CoverageReport = ../CoverageReport/Type.dhall

in    { junit = None (List Text), coverage_report = None CoverageReport }
    : ./Type.dhall
