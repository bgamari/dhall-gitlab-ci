let mergeOptional
    : ∀(a : Type) → (a → a → a) → Optional a → Optional a → Optional a
    = λ(ty : Type) →
      λ(combine : ty → ty → ty) →
      λ(l : Optional ty) →
      λ(r : Optional ty) →
        let onlyR = r

        let onlyL = l

        in  merge
              { None = onlyR
              , Some =
                  λ(lSome : ty) →
                    merge
                      { None = l
                      , Some = λ(rSome : ty) → Some (combine lSome rSome)
                      }
                      r
              }
              onlyL

in  mergeOptional
