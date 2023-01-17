let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let CoverageFormat = ./Type.dhall

let CoverageFormat/toJSON
    : CoverageFormat → JSON.Type
    = λ(format : CoverageFormat) →
        JSON.string (merge { Cobertura = "cobertura" } format)

in  CoverageFormat/toJSON
