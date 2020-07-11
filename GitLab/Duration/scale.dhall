let scale
    : Natural → ./Type → ./Type
    = λ(n : Natural) → λ(d : ./Type) → { seconds = d.seconds * n }

in  scale
