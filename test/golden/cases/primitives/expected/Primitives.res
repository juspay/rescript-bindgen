@module("demo") @react.component
external make: (
  ~label: string=?,
  ~count: int=?,
  ~ratio: float=?,
  ~disabled: bool=?,
  ~payload: JSON.t=?,
  ~createdAt: Date.t=?,
  ~tags: array<string>=?,
  ~meta: Dict.t<JSON.t>=?,
  ~labels: Dict.t<string>=?,
) => React.element = "Primitives"
