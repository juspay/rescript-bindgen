type props = {
  operator?: CtorNameCollisionsTypes.operator,
  gapUnit?: CtorNameCollisionsTypes.gapUnit,
  lineCase?: CtorNameCollisionsTypes.lineCase,
  fillCase?: CtorNameCollisionsTypes.fillCase,
  level?: CtorNameCollisionsTypes.level,
  digit?: CtorNameCollisionsTypes.digit,
  squatter?: CtorNameCollisionsTypes.squatter,
  tri?: CtorNameCollisionsTypes.mixedOrMarker,
  casing?: CtorNameCollisionsTypes.casing,
  stroke?: CtorNameCollisionsTypes.strokeStyle,
  border?: CtorNameCollisionsTypes.borderStyle,
}

@module("demo")
external make: React.component<props> = "Chart"
