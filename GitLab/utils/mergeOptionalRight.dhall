-- Merge optionals. When both are Some, prefer the right one
let mergeOptional = ./mergeOptional.dhall

let mergeOptionalRight
    : ∀(a : Type) → Optional a → Optional a → Optional a
    = λ(ty : Type) →
      λ(l : Optional ty) →
      λ(r : Optional ty) →
        mergeOptional ty (λ(_ : ty) → λ(x : ty) → x) l r

in  mergeOptionalRight
