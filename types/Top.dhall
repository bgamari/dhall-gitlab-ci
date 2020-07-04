let Prelude = ../Prelude.dhall

let Job = ./Job.dhall

let GitSubmoduleStrategy = ./GitSubmoduleStrategy.dhall

in  { Type =
        { jobs : Prelude.Map.Type Text Job.Type
        , gitSubmoduleStrategy : GitSubmoduleStrategy
        }
    , default =
      { jobs = Prelude.Map.empty Text Job.Type
      , GitSubmoduleStrategy = GitSubmoduleStrategy.Normal
      }
    }
