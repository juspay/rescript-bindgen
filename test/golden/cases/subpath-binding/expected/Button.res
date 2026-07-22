type props = {
  theme?: SubpathBindingTypes.theme,
  label: string,
}

@module("demo")
external make: React.component<props> = "Button"
