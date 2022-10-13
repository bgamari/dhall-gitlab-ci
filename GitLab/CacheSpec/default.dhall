let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall

in  { untracked = None Bool, when = When.OnSuccess, policy = None CachePolicy }
