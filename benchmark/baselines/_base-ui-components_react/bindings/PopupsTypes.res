type popupTriggerMap = {
  elements: string,
  idMap: string,
  add: (string, Dom.element) => unit,
  delete: string => unit,
  hasElement: Dom.element => bool,
  hasMatchingElement: Dom.element => bool => bool,
  getById: string => Dom.element,
  entries: unit => string,
  size: int,
}
