let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let CacheKey = ./Type.dhall

let CacheKeyFiles = ../CacheKeyFiles/package.dhall

let CacheKey/toJSON
    : CacheKey → JSON.Type
    = λ(cku : CacheKey) →
        merge
          { Files = λ(c : CacheKeyFiles.Type) → CacheKeyFiles.toJSON c
          , Text = λ(t : Text) → JSON.string t
          }
          cku

in  CacheKey/toJSON
