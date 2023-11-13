-- Several fields either allow you to set a global default (true/false)
-- or a list of keywords (such as variable names). So we define `Choice`
-- to represent those fields.
let Choice = <Defaults : Bool | Keywords : List Text>

-- Implements the `inherit` keyword provided for jobs (https://docs.gitlab.com/ee/ci/yaml/index.html#inherit)

let Inherit = {
    `default`: Optional Choice,
    variables: Optional Choice
}

in { Inherit, Choice }