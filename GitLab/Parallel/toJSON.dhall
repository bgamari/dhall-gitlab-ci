let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let Parallel = ./Type.dhall

let Matrix = ../Matrix/package.dhall

let Parallel/toJSON
    : Parallel → JSON.Type
    = λ(parallel : Parallel) →
        JSON.object (toMap { matrix = Matrix.toJSON parallel.matrix })

in  Parallel/toJSON
