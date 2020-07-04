let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let dropNones
    : ∀(k : Type) → ∀(a : Type) → Map.Type k (Optional a) → Map.Type k a
    = λ(k : Type) →
      λ(a : Type) →
        let f
            : Map.Entry k (Optional a) → Optional (Map.Entry k a)
            = λ(ent : Map.Entry k (Optional a)) →
                merge
                  { None = None (Map.Entry k a)
                  , Some = λ(y : a) → Some { mapKey = ent.mapKey, mapValue = y }
                  }
                  ent.mapValue

        in  Prelude.List.concatMap
              (Map.Entry k (Optional a))
              (Map.Entry k a)
              ( λ(x : Map.Entry k (Optional a)) →
                  Prelude.Optional.toList (Map.Entry k a) (f x)
              )

in  dropNones
