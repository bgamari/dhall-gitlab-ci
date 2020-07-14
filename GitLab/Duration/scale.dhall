let Duration = ./Type.dhall

let scale
    : Natural → Duration → Duration
    = λ(n : Natural) → λ(d : Duration) → { seconds = d.seconds * n }

in  scale
