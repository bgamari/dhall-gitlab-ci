let Prelude = ../Prelude.dhall

let EnvironmentAction = ../EnvironmentAction/Type.dhall

let Kubernetes = ../Kubernetes/Type.dhall

in  { name : Optional Text
    , url : Optional Text
    , on_stop : Optional Text
    , action : Optional EnvironmentAction
    , kubernetes : Optional Kubernetes
    , auto_stop_in : Optional Text
    , deployment_tier : Optional Text
    }
