let Prelude = ../Prelude.dhall

let Environment = ./Type.dhall

let EnvironmentAction = ../EnvironmentAction/Type.dhall

let Kubernetes = ../Kubernetes/Type.dhall

in    { name = None Text
      , url = None Text
      , on_stop = None Text
      , action = None EnvironmentAction
      , kubernetes = None Kubernetes
      , auto_stop_in = None Text
      , deployment_tier = None Text
      }
    : Environment
