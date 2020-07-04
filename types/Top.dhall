let Prelude = ../Prelude.dhall
let Job = ./Job.dhall
let GitSubmoduleStrategy = ./GitSubmoduleStrategy.dhall
in

{ jobs : Prelude.Map.Type Text Job
, gitSubmoduleStrategy : GitSubmoduleStrategy
}