type props = {
  cells: Dict.t<string>,
  label?: string,
}

@module("demo")
external make: React.component<props> = "Grid"
