let GitLab = ../package.dhall

let Prelude = GitLab.Prelude

let renderTop = GitLab.Top.toJSON

-- No inheritance setting
let inherit_absent =
      GitLab.Job::{
      , stage = Some "build"
      , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
      , script = [ "echo 'Hello World'" ]
      , inherit = None GitLab.Inherit.Type
      }

-- Use default inheritance setting
let inherit_inherit_default =
      GitLab.Job::{
      , stage = Some "build"
      , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
      , script = [ "echo 'Hello World'" ]
      , inherit = Some {
          `default` = Some (GitLab.Inherit.Choice.Defaults True),
          variables = None GitLab.Inherit.Choice
        }
      }

-- Use variable default setting
let inherit_variables_default =
      GitLab.Job::{
      , stage = Some "build"
      , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
      , script = [ "echo 'Hello World'" ]
      , inherit = Some {
          `default` = None GitLab.Inherit.Choice,
          variables = Some (GitLab.Inherit.Choice.Defaults True)
        }
      }

-- Use variable list 
let inherit_variables_list =
      GitLab.Job::{
      , stage = Some "build"
      , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
      , script = [ "echo 'Hello World'" ]
      , inherit = Some {
          `default` = None GitLab.Inherit.Choice,
          variables = Some (GitLab.Inherit.Choice.Keywords ["a", "b"])
        }
      }

let inherit_all_fields =
      GitLab.Job::{
      , stage = Some "build"
      , image = Some { name = "alpine:latest", entrypoint = Some [ " " ] }
      , script = [ "echo 'Hello World'" ]
      , inherit = Some {
          `default` = Some (GitLab.Inherit.Choice.Defaults True),
          variables = Some (GitLab.Inherit.Choice.Keywords ["a", "b"])
        }
      }

let top = GitLab.Top::{ jobs = toMap { 
    -- `inherits` field absent
    inherit_absent,
    -- `inherits` sets `default` to true.
    inherit_inherit_default,
    -- `inherits` sets `variables` to `true`
    inherit_variables_default,
    -- `inherits` sets `variables` to a list
    inherit_variables_list,
    -- `inherits` sets all fields to a value (not necessarily useful but shows coverage).
    inherit_all_fields
  } 
}

in  Prelude.JSON.renderYAML (renderTop top)
