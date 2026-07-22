type props = {
  @as("aria-checked") ariaChecked?: [#"true" | #"false" | #mixed],
  @as("aria-disabled") ariaDisabled?: bool,
  @as("aria-level") ariaLevel?: int,
  role?: string,
}

@module("demo")
external make: React.component<props> = "Aria"
