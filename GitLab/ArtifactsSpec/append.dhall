let ArtifactsSpec = ./Type.dhall

let mergeOptionalRight = ../utils/mergeOptionalRight.dhall

let append
    : ArtifactsSpec → ArtifactsSpec → ArtifactsSpec
    = λ(a : ArtifactsSpec) →
      λ(b : ArtifactsSpec) →
        { when = b.when
        , expire_in = b.expire_in
        , reports.junit =
            mergeOptionalRight Text a.reports.junit b.reports.junit
        , paths = a.paths # b.paths
        }

in  append
