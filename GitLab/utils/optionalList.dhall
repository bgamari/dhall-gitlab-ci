let Prelude = ../Prelude.dhall

let optionalList
    : ∀(a : Type) → Optional (List a) → List a
    = λ(a : Type) →
      λ(l : Optional (List a)) →
        Prelude.List.concat a (Prelude.Optional.toList a l)

in  optionalList
