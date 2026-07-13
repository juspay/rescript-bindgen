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
type popupsChildrenConfigV6oib1<'a> = {
  payload?: 'a,
}
type popupsChildrenConfigPopis = {
  payload?: JSON.t,
}
