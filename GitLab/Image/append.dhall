let Image = ./Type.dhall

let mergeOptionalList = ../utils/mergeOptionalList.dhall

let append
    : Image → Image → Image
    = λ(a : Image) →
      λ(b : Image) →
        { name = b.name
        , entrypoint = mergeOptionalList Text a.entrypoint b.entrypoint
        }

in  append
