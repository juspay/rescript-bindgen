type props = {
  d?: SvgPathArrayTypes.stringOrSegTArray,
  box?: (float, float),
}

@module("demo")
external make: React.component<props> = "Path"
