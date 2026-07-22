type props = {
  value: float,
  onChange?: float => unit,
  disabled?: bool,
}

@module("demo")
external make: React.component<props> = "Slider"
