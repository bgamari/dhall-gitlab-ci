let Prelude = ../Prelude.dhall

let Duration = ./Type.dhall

let greaterThan
    : Duration → Duration → Bool
    = λ(x : Duration) →
      λ(y : Duration) →
        Prelude.Natural.greaterThan x.seconds y.seconds

in  greaterThan
