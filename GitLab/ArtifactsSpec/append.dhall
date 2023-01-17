let ArtifactsSpec = ./Type.dhall

let Reports = ../Reports/package.dhall

let mergeOptional = ../utils/mergeOptional.dhall

let mergeOptionalList = ../utils/mergeOptionalList.dhall

let append
    : ArtifactsSpec → ArtifactsSpec → ArtifactsSpec
    = λ(a : ArtifactsSpec) →
      λ(b : ArtifactsSpec) →
        { when = b.when
        , expire_in = b.expire_in
        , reports =
            mergeOptional Reports.Type Reports.append a.reports b.reports
        , paths = mergeOptionalList Text a.paths b.paths
        }

in  append
