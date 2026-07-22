type props = {
  label?: string,
  count?: int,
  ratio?: float,
  disabled?: bool,
  payload?: JSON.t,
  createdAt?: Date.t,
  tags?: array<string>,
  meta?: Dict.t<JSON.t>,
  labels?: Dict.t<string>,
}

@module("demo")
external make: React.component<props> = "Primitives"
