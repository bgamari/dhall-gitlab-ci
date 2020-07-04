let When = ./When.dhall

let Duration = ./Duration.dhall

in  { Type =
        { when : When
        , expire_in : Duration.Type
        , reports : { junit : Optional Text }
        }
    , default = { when = When.OnSuccess, reports.junit = None Text }
    }
