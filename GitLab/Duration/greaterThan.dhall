let Prelude = ./Prelude

let greaterThan
    : ./Type → ./Type → Bool
    = λ(x : ./Type) →
      λ(y : ./Type) →
        Prelude.Natural.greaterThan x.seconds y.seconds

in  greaterThan
