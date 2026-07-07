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
type popupsChildrenConfigV2rd08<'a> = {
  payload?: 'a,
}
type popupsChildrenConfigV1u6b5 = {
  payload?: JSON.t,
}
