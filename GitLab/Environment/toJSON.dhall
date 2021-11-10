let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Environment = ./Type.dhall

let EnvironmentAction = ../EnvironmentAction/package.dhall

let Kubernetes = ../Kubernetes/package.dhall

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let Environment/toJSON
    : Environment → JSON.Type
    = λ(environment : Environment) →
        let everything
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { name =
                    Optional/map Text JSON.Type JSON.string environment.name
                , url = Optional/map Text JSON.Type JSON.string environment.url
                , on_stop =
                    Optional/map Text JSON.Type JSON.string environment.on_stop
                , action =
                    Optional/map
                      EnvironmentAction.Type
                      JSON.Type
                      EnvironmentAction.toJSON
                      environment.action
                , kubernetes =
                    Optional/map
                      Kubernetes.Type
                      JSON.Type
                      Kubernetes.toJSON
                      environment.kubernetes
                , auto_stop_in =
                    Optional/map
                      Text
                      JSON.Type
                      JSON.string
                      environment.auto_stop_in
                , deployment_tier =
                    Optional/map
                      Text
                      JSON.Type
                      JSON.string
                      environment.deployment_tier
                }

        in  JSON.object (dropNones Text JSON.Type everything)

in  Environment/toJSON
