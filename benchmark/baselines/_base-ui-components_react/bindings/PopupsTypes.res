type popupTriggerMap = {
  elements: string,  // 🛑 BROKEN — contains `any`
  idMap: string,  // 🛑 BROKEN — contains `any`
  add: (string, Dom.element) => unit,
  delete: string => unit,
  hasElement: Dom.element => bool,
  hasMatchingElement: Dom.element => bool => bool,
  getById: string => Dom.element,
  entries: unit => string,  // ⚪ loose — was `IterableIterator<[string, Element]>`
  size: float,
}
type popupsChildrenConfig<'a> = {
  payload?: 'a,
}
type popupsChildrenConfig2 = {
  payload?: JSON.t,
}
