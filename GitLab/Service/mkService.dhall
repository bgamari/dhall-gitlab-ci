-- We couldn't provide a default because name is required
let Service = ./Type.dhall

let Service/mkService
    : Text → Service
    = λ(name : Text) →
        { name
        , alias = None Text
        , entrypoint = [] : List Text
        , command = [] : List Text
        }

in  Service/mkService
