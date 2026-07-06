type floatingEvents = {
  emit: (string, option<string>) => unit,  // ⚪ loose — was `T`
  on: (string, string => unit) => unit,  // ⚪ loose — was `any`
  off: (string, string => unit) => unit,  // ⚪ loose — was `any`
}
type floatingNodeType = {
  id?: string,
  parentId: Nullable.t<string>,
  context?: string,  // ⚪ loose — was `FloatingContext`
}
