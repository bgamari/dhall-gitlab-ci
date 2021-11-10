let Environment = ./Type.dhall

let EnvironmentAction = ../EnvironmentAction/package.dhall

let Kubernetes = ../Kubernetes/package.dhall

let mergeOptional = ../utils/mergeOptional.dhall

let mergeOptionalRight = ../utils/mergeOptionalRight.dhall

let append
    : Environment → Environment → Environment
    = λ(a : Environment) →
      λ(b : Environment) →
        { name = mergeOptionalRight Text a.name b.name
        , url = mergeOptionalRight Text a.url b.url
        , on_stop = mergeOptionalRight Text a.on_stop b.on_stop
        , action = mergeOptionalRight EnvironmentAction.Type a.action b.action
        , kubernetes =
            mergeOptional
              Kubernetes.Type
              Kubernetes.append
              a.kubernetes
              b.kubernetes
        , auto_stop_in = mergeOptionalRight Text a.auto_stop_in b.auto_stop_in
        , deployment_tier =
            mergeOptionalRight Text a.deployment_tier b.deployment_tier
        }

in  append
