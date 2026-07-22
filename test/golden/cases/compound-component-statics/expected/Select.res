type props = {
  multi?: bool,
}

@module("demo")
external make: React.component<props> = "Select"

// Compound statics — zero-cost aliases; use <Select.Option />
module Option = SelectOption
