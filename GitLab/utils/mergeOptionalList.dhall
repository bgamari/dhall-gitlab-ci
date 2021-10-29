-- Merge optionals. When both are Some, merge the lists
let Prelude = ../../Prelude.dhall

let mergeOptional = ./mergeOptional.dhall

let mergeOptionalList
    : ∀(a : Type) → Optional (List a) → Optional (List a) → Optional (List a)
    = λ(ty : Type) →
      λ(l : Optional (List ty)) →
      λ(r : Optional (List ty)) →
        mergeOptional (List ty) (λ(a : List ty) → λ(b : List ty) → a # b) l r

in  mergeOptionalList
