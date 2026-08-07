type props = {
  operator?: CtorNameCollisionsTypes.operator,
  gapUnit?: CtorNameCollisionsTypes.gapUnit,
  lineCase?: CtorNameCollisionsTypes.lineCase,
  stroke?: CtorNameCollisionsTypes.strokeStyle,
  border?: CtorNameCollisionsTypes.borderStyle,
}

@module("demo")
external make: React.component<props> = "Chart"
