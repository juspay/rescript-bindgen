type props<'a> = {
  annotations?: array<RecursiveTypeParamCycleTypes.annotationControlPoint<'a>>,
}

@module("demo")
external make: React.component<props<'a>> = "Chart"
