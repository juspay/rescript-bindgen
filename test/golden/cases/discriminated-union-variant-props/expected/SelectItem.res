// #65: discriminated-union props — per-branch requiredness preserved. Render with
//      React.createElement(make, Single({…})). `mode` is auto-filled by @tag.
@tag("mode")
type props =
  | @as("single") Single({label?: string, disabled?: bool, selected: string})
  | @as("multi") Multi({label?: string, disabled?: bool, selectedValues: array<string>, placeholder?: string})

@module("demo")
external make: props => React.element = "SelectItem"
