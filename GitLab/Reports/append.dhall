let Reports = ./Type.dhall

let mergeOptionalList = ../utils/mergeOptionalList.dhall

let append
    : Reports → Reports → Reports
    = λ(a : Reports) →
      λ(b : Reports) →
        { junit = mergeOptionalList Text a.junit b.junit
        , cobertura = b.cobertura
        }

in  append
